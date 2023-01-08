import createMQProducer from '../../../../src/application-rabbitmq/producer'
import { CollectorRequestModel, CollectorResponseModel } from "../../../domain/models/collector";
import { CollectorDataSource } from "../../interfaces/data-sources/collector/collector-data-source";

// import { SQLDatabaseWrapper } from "../../interfaces/data-sources/nosql-database-wrapper";
import { SQLDatabaseWrapper } from "../../interfaces/data-sources/sql-database-wrapper";

const { v4: uuidv4 } = require('uuid');
const POSTGRES_DB = String(process.env.POSTGRES_DB);
const DB_TABLE = POSTGRES_DB + ".collectors";
const SERVER = String(process.env.SERVER_HABBIT)
const QUEUE = "core.collectors"

const producer = createMQProducer(SERVER, QUEUE)
export class PGCollectorDataSource implements CollectorDataSource {

    private db: SQLDatabaseWrapper    

    constructor(db: SQLDatabaseWrapper) { 
        this.db = db  
    }

    async create(Collector: CollectorRequestModel) {  
        const ID = uuidv4()     
        await this.db.query(`insert into ${DB_TABLE} (id, latitude, longitude, address, status) values ($1, $2, $3, $4, $5)`, [ID, Collector.latitude, Collector.longitude, Collector.address, Collector.status])

        const jsonSend = JSON.stringify({
            id: ID,
            latitude: Collector.latitude,
            longitude: Collector.longitude,
            address: Collector.address,
            status: Collector.status,
            type: "collector created",
        })
        producer(jsonSend)

    }

    async getAll(): Promise<CollectorResponseModel[]> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE}`)   
        const result = dbResponse.rows.map(item => ({
            id: item.id,
            latitude: item.latitude,
            longitude: item.longitude,
            address: item.address,
            status: item.status,
        }));
        return result;
    }

    async getOne(id: String): Promise<CollectorResponseModel | boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }

        const result = dbResponse.rows.map(item => ({
            id: item.id,
            latitude: item.latitude,
            longitude: item.longitude,
            address: item.address,
            status: item.status,     
        }));
        return result[0];
    }

    async updateOne(id: String, data: CollectorRequestModel): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }     
        await this.db.query(`update ${DB_TABLE} set latitude = $2, longitude = $3, address = $4, status = $5 where id = $1`, [id, data.latitude, data.longitude, data.address, data.status])

        const jsonSend = JSON.stringify({
            id: id,
            address: data.address,
            status: data.status,                
            type: "collector updated",
        })
        producer(jsonSend)
  
        return true;
    }

    async deleteOne(id: String): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }         
        await this.db.query(`delete from ${DB_TABLE} where id = $1`, [id])

        const jsonSend = JSON.stringify({
            id: id,
            address: dbResponse.rows[0].address,
            type: "collector deleted",
        })
        producer(jsonSend)
      
        return true;
    } 

}