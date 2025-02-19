FROM node:23-alpine

WORKDIR /app
RUN npm install -g @stoplight/prism-cli
COPY . .
CMD ["prism", "mock", "/app/tsp-output/schema/openapi.yaml", "-h", "0.0.0.0", "-p", "3030"]