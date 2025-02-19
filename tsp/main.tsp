import "@typespec/http";
import "@typespec/openapi";

import "./modules/response.tsp";
import "./modules/todo.tsp";
import "./modules/auth.tsp";

using TypeSpec.Http;

@service({
  title: "Todo Service",
})
@TypeSpec.OpenAPI.info({
  version: "1.0",
})
@server("http://localhost:4000/api/v1", "production")
namespace TodoAPI;

@route("/todos")
@tag("Todos")
interface Todos {
	/** List widgets */
	@get list(): global.Response.GetResponse<global.Todo.TodoList>;
	/** Read widgets */
	@get read(@path id: string): global.Response.GetResponse<global.Todo.Todo>;
	/** Create a widget */
	@post create(@body body: global.Todo.CreateTodoRequest):global.Response.PostResponse<global.Todo.Todo>;
	/** Update a widget */
	@patch update(@path id: string, @body body: global.Todo.UpdateTodoRequest): global.Response.PutResponse<global.Todo.Todo>;
	/** Delete a widget */
	@delete delete(@path id: string): global.Response.DeleteResponse;
}


@route("/auth/login")
@tag("Login")
interface Login {
	/** Register */
	@post login(@body body: global.Auth.LoginRequest): global.Response.PostResponse<global.Auth.Auth>;
}

@route("/auth/signup")
@tag("Register")
interface Register {
	/** Register */
	@post signup(@body body: global.Auth.RegisterRequest): global.Response.PostResponse<global.Auth.Auth>;

}

@route("/auth/authentication")
@tag("Authentication")
interface Authentication {
	/** Authentication */
	@post authentication(): global.Response.PostResponse<global.Auth.Auth>;
}


// @format("uuid")
// scalar uuid extends string;


// model Todo {
//   id: uuid;
//   userId: uuid;
//   title: string;
//   content?: string;
//   createdAt: string;
//   updatedAt: string;
// }

// model TodoList {
//   todos: Todo[];
//   total: int64;
// }

// model CreateTodoRequest {
//   title: string;
//   content?: string;
// }

// model UpdateTodoRequest {
//   title: string;
//   content?: string;
// }

// @route("/todos")
// @tag("Todos")
// interface Todos {
//   /** List widgets */
//   @get list(): global.Response.GetResponse<TodoList>;
//   /** Read widgets */
//   @get read(@path id: string): global.Response.GetResponse<Todo>;
//   /** Create a widget */
//   @post create(@body body: CreateTodoRequest):global.Response.PostResponse<Todo>;
//   /** Update a widget */
//   @patch update(@path id: string, @body body: UpdateTodoRequest): global.Response.PutResponse<Todo>;
//   /** Delete a widget */
//   @delete delete(@path id: string): global.Response.DeleteResponse;

// }
