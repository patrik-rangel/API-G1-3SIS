package api

import (
	"context"

	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
)

// POST /api/v1/login
func (h *Handler) LoginUser(ctx context.Context, req openapi.OptLoginUserReq) (openapi.LoginUserRes, error) {
	return nil, nil
}

// POST /api/v1/register
func (h *Handler) RegisterUser(ctx context.Context, req openapi.OptUser) (openapi.RegisterUserRes, error) {
	return nil, nil
}
