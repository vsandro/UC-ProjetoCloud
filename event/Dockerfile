FROM node:18-alpine
ENV SERVER_HABBIT="amqp://guest:guest@rabbitmq:5672"

WORKDIR /usr/app

COPY . .

RUN npm install && \
    npm run build && \
    cp src/swagger.json dist/ 

EXPOSE 5000

CMD ["npm", "start"]