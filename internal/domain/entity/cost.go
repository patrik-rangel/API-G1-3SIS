package entity

import "time"

type TypeCostCenter string

const (
	TypeCostCenterProductive    TypeCostCenter = "PRODUTIVO"
	TypeCostCenterNonProductive TypeCostCenter = "NAO_PRODUTIVO"
)

type CostCenter struct {
	Name         string
	AnnualBudget float64
	Type         TypeCostCenter
}

type VariableExepense struct {
	Type          string
	Describe      string
	Value         float64
	Date          time.Time
	Responsibile  string
	Category      string
	PaymentMethod string
	Observation   string
	Approval      string
	CostCenter    string
}

func (t TypeCostCenter) String() string {
	return string(t)
}

func GetTypeCostCenter(v any) TypeCostCenter {
	switch v {
	case "PRODUTIVO":
		return TypeCostCenterProductive
	case "NAO_PRODUTIVO":
		return TypeCostCenterNonProductive
	default:
		// TODO
		panic("invalid type cost center")
	}

}