import "@typespec/http";
import "@typespec/openapi";

import "./response.tsp";

import "./scalar.tsp";

using TypeSpec.Http;


namespace Todo;


model Todo {
	id: global.ScalarTypes.uuid;
	userId:  global.ScalarTypes.uuid;
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
  
// @route("/todos")
// @tag("Todos")
// interface Todos {
// 	/** List widgets */
// 	@get list(): global.Response.GetResponse<TodoList>;
// 	/** Read widgets */
// 	@get read(@path id: string): global.Response.GetResponse<Todo>;
// 	/** Create a widget */
// 	@post create(@body body: CreateTodoRequest):global.Response.PostResponse<Todo>;
// 	/** Update a widget */
// 	@patch update(@path id: string, @body body: UpdateTodoRequest): global.Response.PutResponse<Todo>;
// 	/** Delete a widget */
// 	@delete delete(@path id: string): global.Response.DeleteResponse;
// }
