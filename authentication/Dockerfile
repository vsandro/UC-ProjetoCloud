FROM node:18-alpine as build
ENV SERVER_HABBIT="amqp://guest:guest@rabbitmq:5672"

WORKDIR /usr/app

COPY . .

RUN yarn global add prisma@4.5.0 && yarn install

FROM node:18-alpine as prod
ENV SERVER_HABBIT="amqp://guest:guest@rabbitmq:5672"

WORKDIR /usr/app

COPY --from=build /usr/app .

RUN yarn build && \
   cp src/swagger.json dist/
       
EXPOSE 4000

 CMD ["yarn", "start"]