import "@typespec/http";
import "@typespec/openapi";

import "./scalar.tsp";

using TypeSpec.Http;


namespace User;

model User {
	id: global.ScalarTypes.uuid;
	name: string;
	email: string;
	createdAt: string;
	updatedAt: string;
}