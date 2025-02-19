import "@typespec/http";
import "@typespec/openapi";

import "../response.tsp";
import "../scalar.tsp";
import "../base.tsp";

using TypeSpec.Http;



model Todo extends BaseModel {
	userId: uuid;
	title: string;
	content?: string;
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
