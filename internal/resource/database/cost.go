package database

import (
	"context"
	"database/sql"
	"strings"
	"time"

	sqlc "github.com/patrik-rangel/API-G1-3SIS/generated/sqlc"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

func (d *Database) InsertVariableExpense(ctx context.Context, variableExepense entity.VariableExepense) error {
	err := d.queries.InsertVariableExpense(ctx, sqlc.InsertVariableExpenseParams{
		TipoVariavel:     variableExepense.Type,
		Valor:            variableExepense.Value,
		CategoriaDespesa: variableExepense.Category,
		DescTransacao:    sql.NullString{String: variableExepense.Describe, Valid: true},
		MetodoPagto:      sql.NullString{String: variableExepense.PaymentMethod, Valid: true},
		Obs:              sql.NullString{String: variableExepense.Observation, Valid: true},
		Data:             variableExepense.Date,
		Responsavel:      variableExepense.Responsibile,
		Aprovado:         boolPtrToNullBool(variableExepense.Approval),
		FkCentroDeCustos: int32(variableExepense.CostCenter),
	})
	if err != nil {
		d.log.Error(err.Error())
		return validateCostErrSql(err)
	}

	return nil
}

func (d *Database) UpdateVariableExepense(ctx context.Context, variableExepense entity.VariableExepense) error {
	if isFalsePtrBool(variableExepense.Approval) {
		variableExpenseCurrent, err := d.queries.GetVariableExpense(ctx, sqlc.GetVariableExpenseParams{
			TipoVariavel: variableExepense.Type,
			Data:         variableExepense.Date,
			Responsavel:  variableExepense.Responsibile,
		})
		if err != nil {
			d.log.Error("Erro ao buscar o gasto variavel")
			d.log.Error(err.Error())
			return validateCostErrSql(err)
		}

		err = d.queries.InsertVariableExpenseDenied(ctx, variableExpenseCurrent.IDGastosVariaveis)
		if err != nil {
			d.log.Error("Erro ao inserir o gasto variavel na tabela de gasto variavel negado")
			d.log.Error(err.Error())
			return validateCostErrSql(err)
		}
	}

	err := d.queries.UpdateVariableExpense(ctx, sqlc.UpdateVariableExpenseParams{
		Aprovado:     boolPtrToNullBool(variableExepense.Approval),
		Data:         variableExepense.Date,
		Responsavel:  variableExepense.Responsibile,
		TipoVariavel: variableExepense.Type,
	})
	if err != nil {
		d.log.Error(err.Error())
		return validateCostErrSql(err)
	}

	return nil
}

func (d *Database) InsertCostCenter(ctx context.Context, costCenter entity.CostCenter) (int, error) {
	ds, de := getYearStartAndEnd()

	budget, err := d.queries.InsertAnnualBudget(ctx, sqlc.InsertAnnualBudgetParams{
		DataInicio:     ds,
		DataFim:        de,
		OrcamentoAnual: costCenter.AnnualBudget,
	})
	if err != nil {
		d.log.Error(err.Error())
		return 0, validateCostErrSql(err)
	}

	area, err := d.queries.InsertArea(ctx, costCenter.Area)
	if err != nil {
		d.log.Error(err.Error())
		return 0, validateCostErrSql(err)
	}

	costCenterInsert, err := d.queries.InsertCostCenter(ctx, sqlc.InsertCostCenterParams{
		NomeCentro:       costCenter.Name,
		Tipo:             costCenter.Type.String(),
		FkOrcamentoAnual: budget.IDOrcamentoAnual,
		FkArea:           area.IDArea,
	})
	if err != nil {
		d.log.Error(err.Error())
		return 0, validateCostErrSql(err)
	}

	return int(costCenterInsert.IDCentroDeCustos), nil
}

func (d *Database) GetVariableExpensesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error) {
	variablesExpense, err := d.queries.SelectAllVariableExpenseByIdCostCenter(ctx, int32(id))
	if err != nil {
		d.log.Error(err.Error())
		return nil, validateCostErrSql(err)
	}

	variablesExpenseEntity := make([]*entity.VariableExepense, 0, len(variablesExpense))

	for _, ve := range variablesExpense {
		variablesExpenseEntity = append(variablesExpenseEntity, &entity.VariableExepense{
			Type:          ve.TipoVariavel,
			Describe:      ve.DescTransacao.String,
			Value:         ve.Valor,
			Date:          ve.Data,
			Responsibile:  ve.Responsavel,
			Category:      ve.CategoriaDespesa,
			PaymentMethod: ve.MetodoPagto.String,
			Observation:   ve.Obs.String,
			Approval:      nullBoolToBoolPtr(ve.Aprovado),
		})
	}

	return variablesExpenseEntity, nil
}

func (d *Database) GetVariableExpensesByEmployee(ctx context.Context, name string) ([]*entity.VariableExepense, error) {
	variablesExpense, err := d.queries.SelectVariableExpenseByEmployee(ctx, name)
	if err != nil {
		d.log.Error(err.Error())
		if strings.Contains(err.Error(), "sql: no rows in result set") {
			return []*entity.VariableExepense{}, nil
		}
		return nil, validateCostErrSql(err)
	}

	variablesExpenseEntity := make([]*entity.VariableExepense, 0, len(variablesExpense))

	for _, ve := range variablesExpense {
		variablesExpenseEntity = append(variablesExpenseEntity, &entity.VariableExepense{
			Type:          ve.TipoVariavel,
			Describe:      ve.DescTransacao.String,
			Value:         ve.Valor,
			Date:          ve.Data,
			Responsibile:  ve.Responsavel,
			Category:      ve.CategoriaDespesa,
			PaymentMethod: ve.MetodoPagto.String,
			Observation:   ve.Obs.String,
			Approval:      nullBoolToBoolPtr(ve.Aprovado),
		})
	}

	return variablesExpenseEntity, nil
}

func (d *Database) GetCostCenterById(ctx context.Context, id int) (*entity.CostCenter, error) {
	executive, err := d.queries.SelectExecutiveById(ctx, int32(id))
	if err != nil {
		d.log.Error(err.Error())
		return nil, validateCostErrSql(err)
	}

	costCenter, err := d.queries.SelectCostCenterById(ctx, executive.FkCentroDeCustos)
	if err != nil {
		d.log.Error(err.Error())
		return nil, validateCostErrSql(err)
	}

	res := &entity.CostCenter{
		Area:         costCenter.NomeArea,
		Name:         costCenter.NomeCentro,
		AnnualBudget: costCenter.OrcamentoAnual,
		Type:         entity.TypeCostCenter(costCenter.Tipo),
	}

	return res, nil
}

func (d *Database) GetEmployeesByCostCenter(ctx context.Context, id int) ([]*entity.Employee, error) {
	employees, err := d.queries.SelectEmployeesByCostCenterId(ctx, int32(id))
	if err != nil {
		d.log.Error(err.Error())
		return nil, validateCostErrSql(err)
	}

	employeesEntity := make([]*entity.Employee, 0, len(employees))

	for _, e := range employees {
		employeesEntity = append(employeesEntity, &entity.Employee{
			Name:     e.Nome.String,
			Email:    e.Email.String,
			JobTitle: e.Cargo,
			Salary:   e.Salario,
			Position: e.Senioridade,
		})
	}

	return employeesEntity, nil
}

func (d *Database) GetVariableExpenseByArea(ctx context.Context, idArea int) ([]*entity.VariableExepenseByArea, error) {
	variablesExpense, err := d.queries.GetVariableExpenseByArea(ctx, int32(idArea))
	if err != nil {
		d.log.Error(err.Error())
		if strings.Contains(err.Error(), "sql: no rows in result set") {
			return []*entity.VariableExepenseByArea{}, nil
		}
		return nil, validateCostErrSql(err)
	}

	variablesExpenseEntity := make([]*entity.VariableExepenseByArea, 0, len(variablesExpense))

	for _, ve := range variablesExpense {
		variablesExpenseEntity = append(variablesExpenseEntity, &entity.VariableExepenseByArea{
			Type:           ve.TipoVariavel,
			Value:          ve.Valor,
			Category:       ve.CategoriaDespesa,
			PaymentMethod:  ve.MetodoPagto.String,
			CostCenterName: ve.NomeCentroDeCustos,
			AreaName:       ve.NomeArea,
			ValueTotal:     float64(ve.TotalValorGastosNegados),
		})
	}

	return variablesExpenseEntity, nil
}

func getYearStartAndEnd() (time.Time, time.Time) {
	// Get the current year
	currentYear := time.Now().Year()

	// Set the date to the first day of the given year
	start := time.Date(currentYear, time.January, 1, 0, 0, 0, 0, time.UTC)

	// Calculate the end date by setting the day to the last day of the year
	end := start.AddDate(0, 11, 31)     // Add 11 months to get to December, then 31 days to get the last day
	end = end.Add(-1 * time.Nanosecond) // Adjust for end-of-day

	return start, end
}

func validateCostErrSql(err error) error {
	switch {
	case strings.Contains(err.Error(), `duplicate key value violates unique constraint "gastos_variaveis_tipo_variavel_data_responsavel_key"`):
		return entity.ErrVariableExpenseInvalid
	case strings.Contains(err.Error(), `duplicate key value violates unique constraint "unique_centro_de_custos"`):
		return entity.ErrCostCenterExists
	case strings.Contains(err.Error(), "sql: no rows in result set"):
		return entity.ErrNotFoundCostCenter
	}

	return err
}

func nullStringToString(v sql.NullString) string {
	if !v.Valid || v.String == "" {
		return ""
	}
	return v.String
}

func nullBoolToBoolPtr(nullBool sql.NullBool) *bool {
	if nullBool.Valid {
		b := nullBool.Bool
		return &b
	}
	return nil
}

func boolPtrToNullBool(b *bool) sql.NullBool {
	if b == nil {
		return sql.NullBool{}
	}
	return sql.NullBool{Valid: true, Bool: *b}
}

func isFalsePtrBool(b *bool) bool {
	return b != nil && *b == false
}
