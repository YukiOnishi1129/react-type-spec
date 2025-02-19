import "@typespec/http";
import "@typespec/openapi";

import "../response.tsp";
import "../scalar.tsp";
import "../base.tsp";

using TypeSpec.Http;


@example(#{
	id: "todo-1",
	userId: "user-1",
	title: "Todo 1",
	content: "Todo Content 1",
	createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
	updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z")
  })
model Todo extends BaseModel {
	userId: uuid;
	title: string;
	content?: string;
}
  
@example(#{
	todos: #[
	  #{
		id: "todo-1",
		userId: "user-1",
		title: "Todo 1",
		content: "Todo Content 1",
		createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
		updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z")
	  },
	  #{
		id: "todo-2",
		userId: "user-1",
		title: "Todo 2",
		content: "Todo Content 2",
		createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
		updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z")
	  }
	],
	total: 2
  })
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
