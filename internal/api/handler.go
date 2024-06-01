package api

import (
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
