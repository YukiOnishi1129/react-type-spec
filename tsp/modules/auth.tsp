import "@typespec/http";
import "@typespec/openapi";

import "./response.tsp";
import "./user.tsp";

import "./scalar.tsp";

using TypeSpec.Http;


namespace Auth;

model Auth {
	user: global.User.User;
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


// @route("/auth/login")
// @tag("Login")
// interface Login {
// 	/** Register */
// 	@post login(@body body: RegisterRequest): global.Response.PostResponse<Auth>;
// }

// @route("/auth/signup")
// @tag("Register")
// interface Register {
// 	/** Register */
// 	@post signup(@body body: RegisterRequest): global.Response.PostResponse<Auth>;

// }

// @route("/auth/authentication")
// @tag("Authentication")
// interface Authentication {
// 	/** Authentication */
// 	@post authentication(): global.Response.PostResponse<Auth>;
// }