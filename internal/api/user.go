package api

import (
	"context"

	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

// POST /api/v1/login
func (h *Handler) LoginUser(ctx context.Context, req openapi.OptLoginUserReq) (openapi.LoginUserRes, error) {
	user := entity.User{
		Email:    req.Value.Email.Value,
		Password: req.Value.Password.Value,
	}

	err := h.userService.Login(ctx, user)
	if err != nil {
		return nil, err
	}

	return &openapi.LoginUserOK{}, nil
}

// POST /api/v1/register
func (h *Handler) RegisterUser(ctx context.Context, req openapi.OptUser) (openapi.RegisterUserRes, error) {
	user := entity.User{
		Name:     req.Value.Name,
		Email:    req.Value.Email,
		Password: req.Value.Password,
		TypeUser: entity.TypeUser(req.Value.TypeUser),
	}

	err := h.userService.Register(ctx, user)
	if err != nil {
		return nil, err
	}

	return &openapi.RegisterUserCreated{}, nil
}
