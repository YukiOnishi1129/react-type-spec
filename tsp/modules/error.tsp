import "@typespec/http";
import "@typespec/openapi";

using TypeSpec.Http;

namespace Error;

@error
model Error {
  code: int64;
  message: string;
}
