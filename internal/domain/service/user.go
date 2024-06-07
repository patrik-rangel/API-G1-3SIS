package service

import (
	"context"

	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/gateway"
	"go.uber.org/zap"
)

var _ User = (*UserService)(nil)

type User interface {
	Login(ctx context.Context, user entity.User) error
	Register(ctx context.Context, user entity.User) error
}

type UserService struct {
	log *zap.Logger
	gtw gateway.User
}

func NewUser(gtw gateway.User) *UserService {
	return &UserService{
		log: logger.NewLogger().Named("layer-service"),
		gtw: gtw,
	}
}

func (u *UserService) Login(ctx context.Context, user entity.User) error {
	return u.gtw.GetUser(ctx, user)
}

func (u *UserService) Register(ctx context.Context, user entity.User) error {
	//return u.gtw.InsertUser(ctx, user)
	return nil
}