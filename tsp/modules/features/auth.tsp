import "@typespec/http";
import "@typespec/openapi";

import "../response.tsp";
import "../scalar.tsp";

import "./user.tsp";

using TypeSpec.Http;

const userExample: User = #{
	id: "user-1",
	name: "User1",
	email: "user1@test.com",
	createdAt: utcDateTime.fromISO("2020-01-01T00:00:00Z"),
	updatedAt: utcDateTime.fromISO("2020-01-01T00:00:00Z")
  };

@example(#{
	user: userExample,
	token: "xxxxx",
})
model Auth {
	user: User;
	token: string;
}

model LoginRequest {
	email: string;
	password: string;
}

model RegisterRequest {
	name: string;
	email: string;
	password: string;
}

