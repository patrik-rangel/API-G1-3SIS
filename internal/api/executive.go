package api

import (
	"context"

	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

// POST api/v1/register/{id_cost_center}
func (h *Handler) RegisterEmployeeByExecutive(ctx context.Context, req openapi.OptEmployee) (openapi.RegisterEmployeeByExecutiveRes, error) {
	employee := entity.Employee{
		Name:       req.Value.Name,
		Email:      req.Value.Email,
		JobTitle:   req.Value.JobTitle,
		Salary:     req.Value.Salary,
		Position:   req.Value.Position,
		CostCenter: req.Value.FkCostCenter.Value,
	}

	err := h.executiveService.RegisterEmployee(ctx, employee)
	if err != nil {
		return nil, err
	}

	return &openapi.RegisterEmployeeByExecutiveCreated{}, nil
}

// POST /api/v1/register-executive/{id_cost_center}
func (h *Handler) RegisterExecutiveWithCostCenterID(ctx context.Context, req openapi.OptRegisterExecutiveWithCostCenterIDReq, params openapi.RegisterExecutiveWithCostCenterIDParams) (openapi.RegisterExecutiveWithCostCenterIDRes, error) {
	user := entity.User{
		Name:  req.Value.Name.Value,
		Email: req.Value.Email.Value,
	}

	err := h.executiveService.RegisterExecutive(ctx, user, params.IDCostCenter)
	if err != nil {
		return nil, err
	}

	return &openapi.RegisterExecutiveWithCostCenterIDCreated{}, nil
}

// POST /api/v1/create-user
func (h *Handler) CreateUserByExecutive(ctx context.Context, req openapi.OptCreateUserByExecutiveReq) (openapi.CreateUserByExecutiveRes, error) {
	user := entity.User{
		Name:  req.Value.Name.Value,
		Email: req.Value.Email.Value,
	}

	password, err := h.executiveService.CreateUserByExecutive(ctx, user)
	if err != nil {
		return nil, err
	}

	return &openapi.CreateUserByExecutiveCreated{PasswordEmployee: openapi.NewOptString(password)}, nil
}
