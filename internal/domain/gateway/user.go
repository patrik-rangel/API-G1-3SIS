package gateway

import (
	"context"

	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

type User interface {
	// Login
	GetUser(ctx context.Context, user entity.User) (*entity.IdsUser, error)
	// Register
	InsertUser(ctx context.Context, user entity.User) error
}
