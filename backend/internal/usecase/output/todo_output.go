package output

import (
	"github.com/YukiOnishi1129/react-type-spec/backend/generated/api"
	"github.com/YukiOnishi1129/react-type-spec/backend/internal/infrastructure/persistence/dto"
)

type TodoOutput = api.Todo

type TodoListOutput api.TodoList

func NewTodoOutput(todo *dto.TodoOutput) *TodoOutput {
	return &TodoOutput{
		Id:        todo.ID,
		Title:     todo.Title,
		Content:   todo.Content,
		CreatedAt: todo.CreatedAt,
		UpdatedAt: todo.UpdatedAt,
	}
}

func NewTodoListOutput(todos *dto.TodoListOutput) *TodoListOutput {
	outputs := make([]TodoOutput, len(todos.Todos))
	for i, todo := range todos.Todos {
		outputs[i] = *NewTodoOutput(&todo)
	}
	return &TodoListOutput{
		Todos: outputs,
		Total: todos.Total,
	}
}