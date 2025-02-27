import "@typespec/http";
import "@typespec/openapi";

import "./modules/response.tsp";
import "./modules/features/todo.tsp";
import "./modules/features/auth.tsp";

using TypeSpec.Http;

@service({
  title: "API Service",
  description: "API Service",
})
@TypeSpec.OpenAPI.info({
  version: "1.0",
})
@server("http://localhost:3030", "develop")
@server("http://localhost:4000", "production")
@route("/api/v1")
@tag("API Service")
@useAuth(BearerAuth)
namespace TodoAPI {
  @route("/todos")
  @tag("Todos")
  interface Todos {
    /** List widgets */
    @get list(): GetResponse<TodoList>;
    /** Read widgets */
    @get read(@path id: string): GetResponse<Todo>;
    /** Create a widget */
    @post create(@body body: CreateTodoRequest): PostResponse<Todo>;
    /** Update a widget */
    @put update(@path id: string, @body body: UpdateTodoRequest): PutResponse<Todo>;
    /** Delete a widget */
    @delete delete(@path id: string): DeleteResponse;
  }

  @route("/auth/login")
  @tag("Login")
  interface Login {
    /** Register */
    @post login(@body body: LoginRequest): PostResponse<Auth>;
  }

  @route("/auth/signup")
  @tag("Register")
  interface Register {
    /** Register */
    @post signup(@body body: RegisterRequest): PostResponse<Auth>;
  }

  @route("/auth/authentication")
  @tag("Authentication")
  interface Authentication {
    /** Authentication */
    @post authentication(): PostResponse<Auth>;
  }
}




