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
		Aprovado:         variableExepense.Approval,
		FkCentroDeCustos: int32(variableExepense.CostCenter),
	})
	if err != nil {
		d.log.Error(err.Error())
		return validateCostErrSql(err)
	}

	return nil
}

func (d *Database) UpdateVariableExepense(ctx context.Context, variableExepense entity.VariableExepense) error {
	err := d.queries.UpdateVariableExpense(ctx, sqlc.UpdateVariableExpenseParams{
		Aprovado:     variableExepense.Approval,
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
			Approval:      ve.Aprovado,
		})
	}

	return variablesExpenseEntity, nil
}

func (d *Database) GetCostCenterById(ctx context.Context, id int) (*entity.CostCenter, error) {
	return nil, nil
}

func (d *Database) GetEmployeesByCostCenter(ctx context.Context, id int) ([]*entity.Employee, error) {
	return nil, nil
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
	}

	return err
}

/* func nullStringToString (v sql.NullString) string {
	if !v.Valid || v.String == "" {
		return ""
	}
	return v.String
} */
