import "@typespec/http";
import "@typespec/openapi";

import "../scalar.tsp";

using TypeSpec.Http;

@example(#{
	id: "user-1",
	name: "User1",
	email: "user1@test.com",
	createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
	updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z")
  })
model User {
	id: uuid;
	name: string;
	email: string;
	createdAt: utcDateTime;
	updatedAt: utcDateTime;
}