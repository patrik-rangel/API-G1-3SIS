package api

import (
	"context"
	"errors"

	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	"github.com/patrik-rangel/API-G1-3SIS/generated/openapi"
	"go.uber.org/zap"
)

type SecurityHandler struct {
	authorization string
	log           *zap.Logger
}

func NewMySecurityHandler(auth string) *SecurityHandler {
	return &SecurityHandler{auth, logger.NewLogger()}
}

func (sh *SecurityHandler) HandleAuthorization(ctx context.Context, _ string, a openapi.Authorization) (context.Context, error) {
	if a.GetAPIKey() == sh.authorization {
		return ctx, nil
	}

	sh.log.Error("invalid token")
	return ctx, errors.New("INVALID_TOKEN")
}
