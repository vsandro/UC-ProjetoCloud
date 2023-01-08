import express from 'express';
import cors from 'cors';
import 'dotenv/config';

const server = express();
server.use(express.json());
server.use(cors());
export default server