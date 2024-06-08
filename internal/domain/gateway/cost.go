package gateway

import (
	"context"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

type Cost interface {
	InsertVariableExpense(ctx context.Context, variableExepense entity.VariableExepense) error
	UpdateVariableExepense(ctx context.Context, variableExepense entity.VariableExepense) error
	InsertCostCenter(ctx context.Context, costCenter entity.CostCenter) (int, error)
	GetVariableExpensesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error)
	GetCostCenterById(ctx context.Context, id int) (*entity.CostCenter, error)
	GetEmployeesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error)
}
