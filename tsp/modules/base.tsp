import "@typespec/http";
import "@typespec/openapi";

import "./scalar.tsp";

using TypeSpec.Http;

model BaseModel {
  id: uuid;
  createdAt: utcDateTime;
  updatedAt: utcDateTime;
}