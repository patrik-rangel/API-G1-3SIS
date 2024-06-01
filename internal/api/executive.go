package api

import (
	"context"

	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
)

// POST api/v1/register
func (h *Handler) RegisterEmployeeByExecutive(ctx context.Context, req openapi.OptEmployee) (openapi.RegisterEmployeeByExecutiveRes, error) {
	return nil, nil
}

// POST /api/v1/register-executive/{id_cost_center}
func (h *Handler) RegisterExecutiveWithCostCenterID(ctx context.Context, req openapi.OptRegisterExecutiveWithCostCenterIDReq, params openapi.RegisterExecutiveWithCostCenterIDParams) (openapi.RegisterExecutiveWithCostCenterIDRes, error) {
	return nil, nil
}

// POST /api/v1/create-user
func (h *Handler) CreateUserByExecutive(ctx context.Context, req openapi.OptCreateUserByExecutiveReq) (openapi.CreateUserByExecutiveRes, error) {
	return nil, nil
}
