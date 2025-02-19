import "@typespec/http";
import "@typespec/openapi";

using TypeSpec.Http;

@error
model Error {
  code: string;
  message: string;
}
