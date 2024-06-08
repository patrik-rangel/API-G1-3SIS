package database

import (
	"context"
	"database/sql"
	"math/rand"
	"strings"
	"time"

	"github.com/oklog/ulid"
	sqlc "github.com/patrik-rangel/API-G1-3SIS/generated/sqlc"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

func (d *Database) InsertEmployee(ctx context.Context, employee entity.Employee) error {
	id, err := d.queries.InsertUserEmployee(ctx, sqlc.InsertUserEmployeeParams{
		Nome:        employee.Name,
		Email:       employee.Email,
		Senha:       generateRandomULID().String(),
		TipoUsuario: "FUNC",
	})
	if err != nil {
		d.log.Error(err.Error())
		return validateExecutiveErrSql(err)
	}

	err = d.queries.InsertEmployeeByIdCostCenter(ctx, sqlc.InsertEmployeeByIdCostCenterParams{
		Nome:             sql.NullString{String: employee.Name, Valid: true},
		Email:            sql.NullString{String: employee.Email, Valid: true},
		Cargo:            employee.JobTitle,
		Senioridade:      employee.Position,
		Salario:          employee.Salary,
		FkCentroDeCustos: int32(employee.CostCenter),
		FkUsuario:        id,
	})

	if err != nil {
		d.log.Error(err.Error())
		return validateExecutiveErrSql(err)
	}

	return nil
}

func (d *Database) InsertExecutive(ctx context.Context, user entity.User, costCenterId int) error {
	id, err := d.queries.SelectUserExecutive(ctx, sqlc.SelectUserExecutiveParams{
		Nome:  user.Name,
		Email: user.Email,
	})
	if err != nil {
		d.log.Error(err.Error())
		return validateExecutiveErrSql(err)
	}

	err = d.queries.InsertExecutive(ctx, sqlc.InsertExecutiveParams{
		FkCentroDeCustos: int32(costCenterId),
		FkUsuario:        id,
	})
	if err != nil {
		d.log.Error(err.Error())
		return validateExecutiveErrSql(err)
	}

	return nil
}

func (d *Database) SelectUserByEmployee(ctx context.Context, user entity.User) (string, error) {
	password, err := d.queries.SelectUserEmployee(ctx, sqlc.SelectUserEmployeeParams{
		Nome:  user.Name,
		Email: user.Email,
	})
	if err != nil {
		d.log.Error(err.Error())
		return "", validateExecutiveErrSql(err)
	}

	return password, nil
}

func generateRandomULID() ulid.ULID {
	for {
		now := time.Now()
		randomMs := now.UnixMilli() + int64(rand.Int63n(1000))

		randomULID, err := ulid.New(uint64(randomMs), nil)
		if err != nil {
			continue
		}

		return randomULID
	}
}

func validateExecutiveErrSql(err error) error {
	switch {
	case strings.Contains(err.Error(), "sql: no rows in result set"):
		return entity.ErrGeneric
	case strings.Contains(err.Error(), "duplicate key value violates unique constraint"):
		return entity.ErrExecutiveExists
	}

	return err
}
