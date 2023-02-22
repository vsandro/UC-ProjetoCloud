import jwt, { Secret, JwtPayload } from 'jsonwebtoken';
import { Request, Response, NextFunction } from 'express';

const SECRET = String(process.env.SECRET_KEY)

export const SECRET_KEY: Secret = SECRET;
export interface CustomRequest extends Request {
 token: string | JwtPayload;
}

export const auth = async (req: Request, res: Response, next: NextFunction) => {
    try {
    const token = req.header('Authorization')?.replace('Bearer ', '');

    if (!token) {
        throw new Error();
    }

    const decoded = jwt.verify(token, SECRET_KEY);
    (req as CustomRequest).token = decoded;

    const POSTGRES_USER = String(process.env.POSTGRES_USER);
    const POSTGRES_PASSWORD = String(process.env.POSTGRES_PASSWORD);    
    const POSTGRES_DB = "arquitetura_authentication";
    const DB_HOST = String(process.env.DB_HOST);
    const DB_PORT = Number(process.env.DB_PORT);

    const { Client } = require('pg');
    const client = new Client({
        user: POSTGRES_USER,
        host: DB_HOST,
        database: POSTGRES_DB,
        password: POSTGRES_PASSWORD,
        port: DB_PORT,
    });

    client.connect();

    const IDUser = decoded.sub;
    //const ROTA = req.url
    const ROTA = "/" + req.path.substring(1, 7)
    const METODO = req.method  

    // console.log(IDUser)
    // console.log(ROTA)
    // console.log(METODO)

    const query = `SELECT * FROM ${POSTGRES_DB}.users, ${POSTGRES_DB}.permissions, ${POSTGRES_DB}.profiles, ${POSTGRES_DB}.operations
    WHERE ${POSTGRES_DB}.users.profile_id = ${POSTGRES_DB}.profiles."id"
    AND ${POSTGRES_DB}.permissions.profile_id = ${POSTGRES_DB}.profiles."id"
    AND ${POSTGRES_DB}.permissions.operation_id = ${POSTGRES_DB}.operations."id"
    AND ${POSTGRES_DB}.users.id = '${IDUser}'
    AND ${POSTGRES_DB}.operations.route = '${ROTA}'
    AND ${POSTGRES_DB}.operations.description LIKE '[choose donation]%'
    AND ${POSTGRES_DB}.operations.method = '${METODO}'`;
    
    // console.log(query)

    client.query(query, (err:any, result:any) => {
        if (err) {
            console.error(err);
            return;
        }
        if (result.rows.length === 0) {
            console.log("Unauthorized user, contact the system administrator") ;
            res.status(401).send('Unauthorized user, contact the system administrator');
            return false            
        } else {
            next();
        }
        client.end();
    });    
    
    } catch (err) {
        res.status(401).send('Please authenticate, invalid token');
    }
};