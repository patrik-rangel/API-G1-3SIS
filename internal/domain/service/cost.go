package service

import (
	"context"

	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/gateway"
	"go.uber.org/zap"
)

var _ Cost = (*CostService)(nil)

type Cost interface {
	AddVariableExpense(ctx context.Context, variableExepense entity.VariableExepense) error
	ApprovalVariableExepense(ctx context.Context, id int, variableExepense entity.VariableExepense) error
	CreateCostCenter(ctx context.Context, costCenter entity.CostCenter) error
	GetVariableExpensesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error)
	GetCostCenterById(ctx context.Context, id int) (*entity.CostCenter, error)
	GetEmployeesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error)
}

type CostService struct {
	log *zap.Logger
	gtw gateway.Cost
}

func NewCost(gtw gateway.Cost) *CostService {
	return &CostService{
		log: logger.NewLogger().Named("layer-service"),
		gtw: gtw,
	}
}

func (c *CostService) AddVariableExpense(ctx context.Context, variableExepense entity.VariableExepense) error {
	return c.gtw.InsertVariableExpense(ctx, variableExepense)
}

func (c *CostService) ApprovalVariableExepense(ctx context.Context, id int, variableExepense entity.VariableExepense) error {
	return c.gtw.UpdateVariableExepense(ctx, id, variableExepense)
}

func (c *CostService) CreateCostCenter(ctx context.Context, costCenter entity.CostCenter) error {
	return c.gtw.InsertCostCenter(ctx, costCenter)
}

func (c *CostService) GetVariableExpensesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error) {
	return c.gtw.GetVariableExpensesByCostCenter(ctx, id)
}

func (c *CostService) GetCostCenterById(ctx context.Context, id int) (*entity.CostCenter, error) {
	return c.gtw.GetCostCenterById(ctx, id)
}

func (c *CostService) GetEmployeesByCostCenter(ctx context.Context, id int) ([]*entity.VariableExepense, error) {
	return c.gtw.GetEmployeesByCostCenter(ctx, id)
}