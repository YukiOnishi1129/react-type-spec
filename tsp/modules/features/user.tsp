import "@typespec/http";
import "@typespec/openapi";

import "../scalar.tsp";
import "../base.tsp";

using TypeSpec.Http;


model User extends BaseModel {
	name: string;
	email: string;
}