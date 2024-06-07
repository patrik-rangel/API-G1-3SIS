package service

import (
	"context"

	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/gateway"
	"go.uber.org/zap"
)

var _ Executive = (*ExecutiveService)(nil)

type Executive interface {
	RegisterEmployee(ctx context.Context, employee entity.Employee) error
	RegisterExecutive(ctx context.Context, user entity.User, costCenterId int) error
	CreateUserByExecutive(ctx context.Context, user entity.User) error
}

type ExecutiveService struct {
	log *zap.Logger
	gtw gateway.Executive
}

func NewExecutive(gtw gateway.Executive) *ExecutiveService {
	return &ExecutiveService{
		log: logger.NewLogger().Named("layer-service"),
		gtw: gtw,
	}
}

func (e *ExecutiveService) RegisterEmployee(ctx context.Context, employee entity.Employee) error {
	return e.gtw.InsertEmployee(ctx, employee)
}
 
func (e *ExecutiveService) RegisterExecutive(ctx context.Context, user entity.User, costCenterId int) error {
	return e.gtw.InsertExecutive(ctx, user, costCenterId)
}

func (e *ExecutiveService) CreateUserByExecutive(ctx context.Context, user entity.User) error {
	return e.gtw.InsertUserByExecutive(ctx, user)
}
