package entity

type TypeUser string

const (
	TypeUserExec TypeUser = "EXEC"
	TypeUserFunc TypeUser = "FUNC"
)

type User struct {
	Name     string
	Email    string
	Password string
	TypeUser TypeUser
}

type IdsUser struct {
	IdExecutive  int
	IdCostCenter int
	TypeUser     TypeUser
}

func (t TypeUser) String() string {
	return string(t)
}

func GetTypeUser(v any) TypeUser {
	switch v {
	case "EXEC":
		return TypeUserExec
	case "FUNC":
		return TypeUserFunc
	default:
		// TODO
		panic("invalid type user")
	}
}
