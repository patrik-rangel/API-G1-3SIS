package api

import (
	"context"
	"fmt"

	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

// POST /api/v1/create-variable-cost/{id-cost-center}
func (h *Handler) AddVariableExpense(ctx context.Context, req openapi.OptVariableExpense, params openapi.AddVariableExpenseParams) (openapi.AddVariableExpenseRes, error) {
	variableExpense := entity.VariableExepense{
		Type:          req.Value.TypeVariable,
		Describe:      req.Value.Describe,
		Value:         req.Value.Value,
		Date:          req.Value.Date,
		Responsibile:  req.Value.Responsible,
		Category:      req.Value.Category,
		PaymentMethod: req.Value.PaymentMethod,
		Observation:   req.Value.Obs,
		Approval:      SetBool(req.Value.Approval),
		CostCenter:    params.IDCostCenter,
	}

	err := h.costService.AddVariableExpense(ctx, variableExpense)
	if err != nil {
		return nil, err
	}

	return &openapi.AddVariableExpenseCreated{}, nil
}

// PATCH /api/v1/variable-cost/{id-variable-expense}
func (h *Handler) ApprovalVariableExepense(ctx context.Context, req openapi.OptVariableExpenseUpdate, params openapi.ApprovalVariableExepenseParams) (openapi.ApprovalVariableExepenseRes, error) {
	return nil, nil
}

// POST /api/v1/cost-centers
func (h *Handler) CreateCostCenter(ctx context.Context, req openapi.OptCostCenter) (openapi.CreateCostCenterRes, error) {
	costCenter := entity.CostCenter{
		Area:         req.Value.Area,
		Name:         req.Value.CostCenterName,
		AnnualBudget: req.Value.AnnualBudget,
		Type:         entity.TypeCostCenter(req.Value.TypeCostCenter),
	}

	id, err := h.costService.CreateCostCenter(ctx, costCenter)
	if err != nil {
		return nil, err
	}

	return &openapi.CreateCostCenterCreated{IDCostCenter: openapi.NewOptString(fmt.Sprintf("%d", id))}, nil
}

// GET /api/v1/variable-cost/by-cost-center/{id-cost-center}
func (h *Handler) GetVariableExpensesByCostCenter(ctx context.Context, params openapi.GetVariableExpensesByCostCenterParams) (openapi.GetVariableExpensesByCostCenterRes, error) {
	return nil, nil
}

// GET /api/v1/cost-center/{id-cost-center}
func (h *Handler) GetCostCenterById(ctx context.Context, params openapi.GetCostCenterByIdParams) (openapi.GetCostCenterByIdRes, error) {
	return &openapi.CostCenter{}, nil
}

// GET /api/v1/employees/by-cost-center/{id-cost-center}
func (h *Handler) GetEmployeesByCostCenter(ctx context.Context, params openapi.GetEmployeesByCostCenterParams) (openapi.GetEmployeesByCostCenterRes, error) {
	return nil, nil
}

func SetBool(v openapi.OptBool) bool {
	if v.Value == false {
		return false
	} else {
		return true
	}
}
