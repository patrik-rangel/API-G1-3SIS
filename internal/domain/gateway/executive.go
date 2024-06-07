package gateway

import (
	"context"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

type Executive interface {
	InsertEmployee(ctx context.Context, employee entity.Employee) error
	InsertExecutive(ctx context.Context, user entity.User, costCenterId int) error
	InsertUserByExecutive(ctx context.Context, user entity.User) error
}
