package database

import (
	"context"
	"errors"
	"strings"

	"github.com/jmoiron/sqlx"
	logger "github.com/patrik-rangel/API-G1-3SIS/config/log"
	sql "github.com/patrik-rangel/API-G1-3SIS/generated/sqlc"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
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

func (d *Database) GetUser(ctx context.Context, user entity.User) error {
	userRows, err := d.queries.GetUser(ctx, sql.GetUserParams{
		Email: user.Email,
		Senha: user.Password,
	})
	if err != nil {
		d.log.Error(err.Error())
		if validateErrSql(err) {
			return entity.ErrNotFoundUser
		}
		return err
	}

	if userRows == (sql.Usuario{}) {
		return errors.New("USER NOT FOUND")
	}

	return nil
}

func validateErrSql(err error) bool {
	return err != nil && strings.Contains(err.Error(), "sql: no rows in result set")
}
