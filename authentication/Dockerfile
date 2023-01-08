FROM node:18-alpine
ENV SERVER_HABBIT="amqp://guest:guest@rabbitmq:5672"

WORKDIR /usr/app

COPY . .

RUN npm install && \
    npm run build && \
    cp src/swagger.json dist/
       
COPY src/swagger.json /usr/app/dist/

EXPOSE 4000

CMD ["npm", "start"]