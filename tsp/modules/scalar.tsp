import "@typespec/http";
import "@typespec/openapi";

using TypeSpec.Http;

namespace ScalarTypes;

@format("uuid")
scalar uuid extends string;