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

// PATCH /api/v1/create-variable-cost
func (h *Handler) ApprovalVariableExepense(ctx context.Context, req openapi.OptVariableExpenseUpdate) (openapi.ApprovalVariableExepenseRes, error) {
	variableExpense := entity.VariableExepense{
		Date:         req.Value.Date,
		Responsibile: req.Value.Responsible,
		Type:         req.Value.VariableType,
		Approval:     req.Value.Approved,
	}

	err := h.costService.ApprovalVariableExepense(ctx, variableExpense)
	if err != nil {
		return nil, err
	}

	return &openapi.ApprovalVariableExepenseOK{}, nil
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
	variablesExpenses, err := h.costService.GetVariableExpensesByCostCenter(ctx, params.IDCostCenter)
	if err != nil {
		return nil, err
	}

	var res openapi.ListVariableExpense = make([]openapi.VariableExpense, 0, len(variablesExpenses))

	for _, ve := range variablesExpenses {
		res = append(res, openapi.VariableExpense{
			TypeVariable:  ve.Type,
			Describe:      ve.Describe,
			Value:         ve.Value,
			Date:          ve.Date,
			Responsible:   ve.Responsibile,
			Category:      ve.Category,
			PaymentMethod: ve.PaymentMethod,
			Obs:           ve.Observation,
			Approval:      openapi.NewOptBool(ve.Approval),
		})
	}

	return &res, nil
}

// GET /api/v1/variable-cost/by-cost-center/{name-employee}
func (h *Handler) GetVariableExpensesByEmployee(ctx context.Context, params openapi.GetVariableExpensesByEmployeeParams) (openapi.GetVariableExpensesByEmployeeRes, error) {
	variablesExpenses, err := h.costService.GetVariableExpensesByEmployee(ctx, params.NameEmployee)

	if err != nil {
		return nil, err
	}

	var res openapi.ListVariableExpense = make([]openapi.VariableExpense, 0, len(variablesExpenses))

	for _, ve := range variablesExpenses {
		res = append(res, openapi.VariableExpense{
			TypeVariable:  ve.Type,
			Describe:      ve.Describe,
			Value:         ve.Value,
			Date:          ve.Date,
			Responsible:   ve.Responsibile,
			Category:      ve.Category,
			PaymentMethod: ve.PaymentMethod,
			Obs:           ve.Observation,
			Approval:      openapi.NewOptBool(ve.Approval),
		})
	}

	return &res, nil
}

// GET /api/v1/cost-center/{id-executive}
func (h *Handler) GetCostCenterById(ctx context.Context, params openapi.GetCostCenterByIdParams) (openapi.GetCostCenterByIdRes, error) {
	costCenter, err := h.costService.GetCostCenterById(ctx, params.IDExecutive)
	if err != nil {
		return nil, err
	}

	return &openapi.CostCenter{
		Area:           costCenter.Area,
		CostCenterName: costCenter.Name,
		AnnualBudget:   costCenter.AnnualBudget,
		TypeCostCenter: openapi.CostCenterTypeCostCenter(costCenter.Type.String()),
	}, nil
}

// GET /api/v1/employees/by-cost-center/{id-cost-center}
func (h *Handler) GetEmployeesByCostCenter(ctx context.Context, params openapi.GetEmployeesByCostCenterParams) (openapi.GetEmployeesByCostCenterRes, error) {
	employees, err := h.costService.GetEmployeesByCostCenter(ctx, params.IDCostCenter)
	if err != nil {
		return nil, err
	}

	var res openapi.ListEmployee = make([]openapi.Employee, 0, len(employees))

	for _, e := range employees {
		res = append(res, openapi.Employee{
			Name:     e.Name,
			Email:    e.Email,
			JobTitle: e.JobTitle,
			Salary:   e.Salary,
			Position: e.Position,
		})
	}

	return &res, nil
}

func SetBool(v openapi.OptBool) bool {
	if !v.Value {
		return false
	} else {
		return true
	}
}
