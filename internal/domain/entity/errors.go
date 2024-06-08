package entity

import "errors"

var ErrNotFoundUser = errors.New("NOT_FOUND_USER")

var ErrGeneric = errors.New("GENERIC_ERROR")

var ErrDatabase = errors.New("DATABASE_ERROR")

var ErrUserExists = errors.New("USER_EXISTS")

var ErrExecutiveExists = errors.New("EXECUTIVE_EXISTS")

var ErrCostCenterExists = errors.New("COST_CENTER_EXISTS")

var ErrVariableExpenseInvalid = errors.New("INVALID_VARIABLE_EXPENSE")

var ErrNotFoundCostCenter = errors.New("NOT_FOUND_COST_CENTER")
