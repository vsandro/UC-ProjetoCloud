import express from 'express';
import bodyParser from 'body-parser'
import cors from 'cors';
import 'dotenv/config';

const server = express();
server.use(express.json());
server.use(cors());
server.use(bodyParser.json())
export default server