import "@typespec/http";
import "@typespec/openapi";

import "./scalar.tsp";

using TypeSpec.Http;


model User {
	id: uuid;
	name: string;
	email: string;
	createdAt: string;
	updatedAt: string;
}