import createMQConsumer from '../src/application-rabbitmq/consumer'
import 'dotenv/config';
import cors from 'cors';

import express, { NextFunction, Request, Response } from 'express';
import 'express-async-errors';
import { routes } from './routes';

const app = express();
app.use(cors());

const bodyParser = require('body-parser');
app.use(bodyParser.json());

app.use(express.json());
app.use(routes);

app.use((err: Error, request: Request, response: Response, next: NextFunction) => {
  if (err instanceof Error) {
    return response.status(400).json({
      message: err.message,
    });
  }

  return response.status(500).json({
    status: 'error',
    message: 'Internal server error',
  });
});

const swaggerUi = require('swagger-ui-express'),
swaggerDocument = require('./swagger.json');

app.use('/api-docs',
    swaggerUi.serve, 
    swaggerUi.setup(swaggerDocument)
);

const SERVER = String(process.env.SERVER_HABBIT)

const consumerStores = createMQConsumer(SERVER, "core.stores");

consumerStores();

const PORT = process.env.PORT

app.listen(PORT, () => {
  console.log("[choose donation]" + "\x1b[34m" + " Server running" + "\x1b[0m" + " on port " + PORT);
});
