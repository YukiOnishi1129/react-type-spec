package output

import (
	"github.com/YukiOnishi1129/react-type-spec/backend/generated/api"
	"github.com/YukiOnishi1129/react-type-spec/backend/internal/infrastructure/persistence/dto"
)

type UserOutput = api.User

func ConvertUserOutput(user *dto.UserOutput) *UserOutput {
	return &UserOutput{
		Id:        user.ID,
		Name:      user.Name,
		Email:     user.Email,
		CreatedAt: user.CreatedAt,
		UpdatedAt: user.UpdatedAt,
	}
}