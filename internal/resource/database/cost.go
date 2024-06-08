package database

import (
	"context"
	"strings"
	"time"

	sql "github.com/patrik-rangel/API-G1-3SIS/generated/sqlc"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

func (d *Database) InsertVariableExpense(ctx context.Context, variableExepense entity.VariableExepense) error {
	return nil
}

func (d *Database) UpdateVariableExepense(ctx context.Context, id int, variableExepense entity.VariableExepense) error {
	return nil
}

func (d *Database) InsertCostCenter(ctx context.Context, costCenter entity.CostCenter) (int, error) {
	ds, de := getYearStartAndEnd()

	budget, err := d.queries.InsertAnnualBudget(ctx, sql.InsertAnnualBudgetParams{
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

	costCenterInsert, err := d.queries.InsertCostCenter(ctx, sql.InsertCostCenterParams{
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
	return nil, nil
}

func (d *Database) GetCostCenterById(ctx context.Context, id int) (*entity.CostCenter, error) {
	return nil, nil
}

func (d *Database) GetEmployeesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error) {
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
	case strings.Contains(err.Error(), "duplicate key value violates unique constraint"):
		return entity.ErrCostCenterExists
	}

	return err
}
