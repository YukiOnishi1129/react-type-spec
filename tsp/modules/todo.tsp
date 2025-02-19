import "@typespec/http";
import "@typespec/openapi";

import "./response.tsp";

import "./scalar.tsp";

using TypeSpec.Http;



model Todo {
	id: uuid;
	userId: uuid;
	title: string;
	content?: string;
	createdAt: string;
	updatedAt: string;
}
  
model TodoList {
	todos: Todo[];
	total: int64;
}
  
model CreateTodoRequest {
	title: string;
	content?: string;
}
  
model UpdateTodoRequest {
	title: string;
	content?: string;
}
