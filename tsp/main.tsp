import "@typespec/http";

using TypeSpec.Http;

@service({
  title: "Todo Service",
})
namespace DemoService;

@error
model Error {
  code: int64;
  message: string;
}

@format("uuid")
scalar uuid extends string;


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

model CreateTodo {
  title: string;
  content?: string;
}

model UpdateTodo {
  title: string;
  content?: string;
}

@route("/todos")
@tag("Todos")
interface Todos {
  /** List widgets */
  @get list(): TodoList | Error;
  /** Read widgets */
  @get read(@path id: string): Todo | Error;
  /** Create a widget */
  @post create(@body body: CreateTodo): Todo | Error;
  /** Update a widget */
  @patch update(@path id: string, @body body: UpdateTodo): Todo | Error;
  /** Delete a widget */
  @delete delete(@path id: string): void | Error;

}
