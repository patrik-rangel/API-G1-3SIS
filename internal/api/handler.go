package api

import (
	"context"
	"errors"
	"fmt"

	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/service"
	"go.uber.org/zap"
)

var _ openapi.Handler = (*Handler)(nil)

type Handler struct {
	log              *zap.Logger
	userService      service.User
	executiveService service.Executive
	costService      service.Cost
}

func NewHandler(u service.User, e service.Executive, c service.Cost) *Handler {
	return &Handler{
		log:              logger.NewLogger().Named("layer-handler"),
		userService:      u,
		executiveService: e,
		costService:      c,
	}
}

func (h *Handler) NewError(ctx context.Context, err error) *openapi.ErrorResponseStatusCode {
	statusCode := 500
	msg := entity.ErrGeneric.Error()

	switch {
	case errors.Is(err, entity.ErrNotFoundUser):
		statusCode = 404
		msg = entity.ErrNotFoundUser.Error()
	case errors.Is(err, entity.ErrDatabase):
		statusCode = 500
		msg = entity.ErrDatabase.Error()
	case errors.Is(err, entity.ErrUserExists):
		statusCode = 409
		msg = entity.ErrUserExists.Error()
	case errors.Is(err, entity.ErrExecutiveExists):
		statusCode = 409
		msg = entity.ErrExecutiveExists.Error()
	case errors.Is(err, entity.ErrCostCenterExists):
		statusCode = 409
		msg = entity.ErrCostCenterExists.Error()
	case errors.Is(err, entity.ErrVariableExpenseInvalid):
		statusCode = 400
		msg = entity.ErrVariableExpenseInvalid.Error()
	case errors.Is(err, entity.ErrNotFoundCostCenter):
		statusCode = 404
		msg = entity.ErrNotFoundCostCenter.Error()
	}

	h.log.Error(fmt.Sprintf("Error: %s", err))

	return &openapi.ErrorResponseStatusCode{
		StatusCode: statusCode,
		Response: openapi.ErrorResponse{
			Message: openapi.NewOptString(msg),
		},
	}
}
