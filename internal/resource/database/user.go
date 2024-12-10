package database

import (
	"context"
	"errors"
	"strings"

	sql "github.com/patrik-rangel/API-G1-3SIS/generated/sqlc"
	"github.com/patrik-rangel/API-G1-3SIS/internal/domain/entity"
)

func (d *Database) GetUser(ctx context.Context, user entity.User) (*entity.IdsUser, error) {
	userRows, err := d.queries.GetUser(ctx, sql.GetUserParams{
		Email: user.Email,
		Senha: user.Password,
	})
	if err != nil {
		d.log.Error(err.Error())
		return nil, validateUserErrSql(err)
	}

	if userRows == (sql.Usuario{}) {
		return nil, errors.New("USER NOT FOUND")
	}

	idUser := userRows.IDUsuario
	if userRows.TipoUsuario == "EXEC" {
		idsRows, err := d.queries.GetIdsExecutive(ctx, idUser)
		if err != nil {
			d.log.Error(err.Error())
			return nil, validateUserErrSql(err)
		}

		idsExecutive := &entity.IdsUser{
			NameUser:     userRows.Nome,
			IdExecutive:  int(idsRows.IdExecutivo),
			IdCostCenter: int(idsRows.FkCentroDeCustos),
			TypeUser:     entity.TypeUser(userRows.TipoUsuario),
			IdArea:       int(idsRows.AreaID),
		}
		return idsExecutive, nil
	} else {
		idsRows, err := d.queries.GetIdsEmployee(ctx, idUser)
		if err != nil {
			d.log.Error(err.Error())
			return nil, validateUserErrSql(err)
		}

		return &entity.IdsUser{
			IdCostCenter: int(idsRows.FkCentroDeCustos),
			NameUser:     userRows.Nome,
			TypeUser:     entity.TypeUser(userRows.TipoUsuario),
		}, nil
	}

}

func (d *Database) InsertUser(ctx context.Context, user entity.User) error {
	err := d.queries.InsertUser(ctx, sql.InsertUserParams{
		Nome:        user.Name,
		Email:       user.Email,
		Senha:       user.Password,
		TipoUsuario: user.TypeUser.String(),
	})

	if err != nil {
		d.log.Error(err.Error())
		return validateUserErrSql(err)
	}

	return nil
}

func validateUserErrSql(err error) error {
	switch {
	case strings.Contains(err.Error(), "sql: no rows in result set"):
		return entity.ErrNotFoundUser
	case strings.Contains(err.Error(), "duplicate key value violates unique constraint"):
		return entity.ErrUserExists
	}

	return err
}
