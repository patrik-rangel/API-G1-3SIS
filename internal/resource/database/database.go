package database

import (
	"github.com/jmoiron/sqlx"
	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	sql "github.com/patrik-rangel/API-G1-3SIS/generated/sqlc"
	"go.uber.org/zap"
)

type Database struct {
	log     *zap.Logger
	db      *sqlx.DB
	queries *sql.Queries
}

func New(db *sqlx.DB) *Database {
	return &Database{
		log:     logger.NewLogger().Named("layer-database"),
		db:      db,
		queries: sql.New(db),
	}
}
