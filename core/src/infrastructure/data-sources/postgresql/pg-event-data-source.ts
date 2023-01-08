import createMQProducer from '../../../../src/application-rabbitmq/producer'
import { EventRequestModel, EventResponseModel } from "../../../domain/models/event";
import { EventDataSource } from "../../interfaces/data-sources/event/event-data-source";

// import { SQLDatabaseWrapper } from "../../interfaces/data-sources/nosql-database-wrapper";
import { SQLDatabaseWrapper } from "../../interfaces/data-sources/sql-database-wrapper";

const { v4: uuidv4 } = require('uuid');
const POSTGRES_DB = String(process.env.POSTGRES_DB);
const DB_TABLE = POSTGRES_DB + ".events";
const SERVER = String(process.env.SERVER_HABBIT)
const QUEUE = "core.events"

const producer = createMQProducer(SERVER, QUEUE)
export class PGEventDataSource implements EventDataSource {

    private db: SQLDatabaseWrapper    

    constructor(db: SQLDatabaseWrapper) { 
        this.db = db  
    }

    async create(Event: EventRequestModel) {  
        const ID = uuidv4()     
        await this.db.query(`insert into ${DB_TABLE} (id, name) values ($1, $2)`, [ID, Event.name])

        const jsonSend = JSON.stringify({
            id: ID,
            name: Event.name,
            type: "event created",
        })
        producer(jsonSend)
    }

    async getAll(): Promise<EventResponseModel[]> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE}`)   
        const result = dbResponse.rows.map(item => ({
            id: item.id,
            name: item.name,
            active: item.active,
        }));
        return result;
    }

    async getOne(id: String): Promise<EventResponseModel | boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }

        const result = dbResponse.rows.map(item => ({
            id: item.id,
            name: item.name,
            active: item.active,
        }));
        return result[0];
    }

    async updateOne(id: String, data: EventRequestModel): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }     
        await this.db.query(`update ${DB_TABLE} set name = $2, active = $3 where id = $1`, [id, data.name, data.active])

        const jsonSend = JSON.stringify({
            id: id,
            name: data.name,
            type: "event updated",
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
            name: dbResponse.rows[0].name,
            type: "event deleted",
        })
        producer(jsonSend)
      
        return true;
    } 

}