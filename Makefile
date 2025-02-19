include .env

empty:
	echo "empty"

# enter the container
backend-ssh:
	docker exec -it $(BACKEND_CONTAINER_NAME) sh

db-sh:
	docker exec -it $(POSTGRES_HOST) sh

# psql -h 127.0.0.1 -p 5432 -U user REACT_OUTPUT_CRUD_AUTH_API_DB

# environment
gen-open-api:
	tsp compile ./tsp --output-dir=tsp/tsp-output

gen-front-api:
	npx @openapitools/openapi-generator-cli generate -i ./tsp/tsp-output/schema/openapi.yaml -g typescript-axios -o ./frontend/src/apis/generated

gen-go-api:
	oapi-codegen -config ./backend/openapi.config.yml ./tsp/tsp-output/schema/openapi.yaml