import "@typespec/http";
import "@typespec/openapi";

import "../response.tsp";
import "../scalar.tsp";

import "./user.tsp";



using TypeSpec.Http;

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

