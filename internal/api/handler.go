package api

import (
	"context"

	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"go.uber.org/zap"
)

var _ openapi.Handler = (*Handler)(nil)

type Handler struct {
	log *zap.Logger
}

func NewHandler() *Handler {
	return &Handler{
		log: logger.NewLogger().Named("layer-handler"),
	}
}

// POST /api/v1/variable-cost
func (h *Handler) AddVariableExpense(ctx context.Context, req openapi.OptVariableExpense) (openapi.AddVariableExpenseRes, error) {
	return &openapi.AddVariableExpenseCreated{}, nil
}

// PATCH /api/v1/variable-cost/{id-variable-expense}
func (h *Handler) ApprovalVariableExepense(ctx context.Context, req openapi.OptVariableExpenseUpdate, params openapi.ApprovalVariableExepenseParams) (openapi.ApprovalVariableExepenseRes, error) {
	return nil, nil
}

// POST /api/v1/cost-centers
func (h *Handler) CreateCostCenter(ctx context.Context, req openapi.OptCostCenter) (openapi.CreateCostCenterRes, error) {
	return nil, nil
}

// POST /api/v1/create-user
func (h *Handler) CreateUserByExecutive(ctx context.Context, req openapi.OptCreateUserByExecutiveReq) (openapi.CreateUserByExecutiveRes, error) {
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

// GET /api/v1/variable-cost/by-cost-center/{id-cost-center}
func (h *Handler) GetVariableExpensesByCostCenter(ctx context.Context, params openapi.GetVariableExpensesByCostCenterParams) (openapi.GetVariableExpensesByCostCenterRes, error) {
	return nil, nil
}

// POST /api/v1/login
func (h *Handler) LoginUser(ctx context.Context, req openapi.OptLoginUserReq) (openapi.LoginUserRes, error) {
	return nil, nil
}

// POST /api/v1/register
func (h *Handler) RegisterUser(ctx context.Context, req openapi.OptUser) (openapi.RegisterUserRes, error) {
	return nil, nil
}

// POST api/v1/register
func (h *Handler) RegisterEmployeeByExecutive(ctx context.Context, req openapi.OptEmployee) (openapi.RegisterEmployeeByExecutiveRes, error) {
	return nil, nil
}

// POST /api/v1/register-executive/{id_cost_center}
func (h *Handler) RegisterExecutiveWithCostCenterID(ctx context.Context, req openapi.OptRegisterExecutiveWithCostCenterIDReq, params openapi.RegisterExecutiveWithCostCenterIDParams) (openapi.RegisterExecutiveWithCostCenterIDRes, error) {
	return nil, nil
}
