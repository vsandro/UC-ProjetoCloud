FROM node:18-alpine AS build
ENV SERVER_HABBIT="amqp://guest:guest@rabbitmq:5672"

WORKDIR /usr/app

COPY . .
COPY ./docker/.env .

RUN npm install

FROM node:18-alpine AS prod
ENV SERVER_HABBIT="amqp://guest:guest@rabbitmq:5672"

WORKDIR /usr/app

COPY --from=build /usr/app/ .

RUN npm run build && \
   cp src/swagger.json dist/

EXPOSE 4300

CMD ["npm", "start"]