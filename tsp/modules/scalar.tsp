import "@typespec/http";
import "@typespec/openapi";

using TypeSpec.Http;

@format("uuid")
scalar uuid extends string;