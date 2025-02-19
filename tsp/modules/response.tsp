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

model SuccessNoContentResponse {
	@statusCode status: 204;
	@body body: {
	  message: string;
	};
}

model BadRequestErrorResponse {
	@statusCode status: 400;
	@body body: Error
}

model UnauthorizedErrorResponse {
	@statusCode status: 401;
	@body body: Error
}
  

model ForbiddenErrorResponse {
	@statusCode status: 403;
	@body body: Error
}


model NotFoundErrorResponse {
	@statusCode status: 404;
	@body body: Error
}

model InternalServerErrorResponse {
	@statusCode status: 500;
	@body body: Error
}


alias ErrorResponse = BadRequestErrorResponse | UnauthorizedErrorResponse | ForbiddenErrorResponse | NotFoundErrorResponse | InternalServerErrorResponse;

alias GetResponse<T> = SuccessResponse<T> | ErrorResponse;

alias PostResponse<T> = SuccessCreatedResponse<T> | ErrorResponse;

alias PutResponse<T> = SuccessResponse<T> | ErrorResponse;

alias DeleteResponse = SuccessNoContentResponse | ErrorResponse;
