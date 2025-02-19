import "@typespec/http";
import "@typespec/openapi";

import "./error.tsp";

using TypeSpec.Http;

model SuccessResponse<T> {
	@statusCode status: 200;
	@body body: {
	  data: T
	};
}

model SuccessCreatedResponse<T> {
	@statusCode status: 201;
	@body body: {
	  data: T
	};
}

@example(#{
   status: 204, body: #{ message: "No content" }
})
model SuccessNoContentResponse {
	@statusCode status: 204;
	@body body: {
	  message: string;
	};
}

@example(#{
	status: 400, body: #{ 
		code: 400,
		message: "Bad Request"
	 }
 })
model BadRequestErrorResponse {
	@statusCode status: 400;
	@body body: Error
}

@example(#{
	status: 401, body: #{ 
		code: 401,
		message: "Unauthorized"
	 }
 })
model UnauthorizedErrorResponse {
	@statusCode status: 401;
	@body body: Error
}
  

@example(#{
	status: 403, body: #{ 
		code: 403,
		message: "Forbidden"
	 }
 })
model ForbiddenErrorResponse {
	@statusCode status: 403;
	@body body: Error
}


@example(#{
	status: 404, body: #{ 
		code: 404,
		message: "Not Found"
	 }
 })
model NotFoundErrorResponse {
	@statusCode status: 404;
	@body body: Error
}

@example(#{
	status: 500, body: #{ 
		code: 500,
		message: "Internal Server Error"
	 }
 })
model InternalServerErrorResponse {
	@statusCode status: 500;
	@body body: Error
}


alias ErrorResponse = BadRequestErrorResponse | UnauthorizedErrorResponse | ForbiddenErrorResponse | NotFoundErrorResponse | InternalServerErrorResponse;

alias GetResponse<T> = SuccessResponse<T> | ErrorResponse;

alias PostResponse<T> = SuccessCreatedResponse<T> | ErrorResponse;

alias PutResponse<T> = SuccessResponse<T> | ErrorResponse;

alias DeleteResponse = SuccessNoContentResponse | ErrorResponse;
