import { Event_recordsRequestModel, Event_recordsResponseModel } from "../../../domain/models/event_records";
import { Event_recordsDataSource } from "../../interfaces/data-sources/event_records/event_records-data-source";

// import { SQLDatabaseWrapper } from "../../interfaces/data-sources/nosql-database-wrapper";
import { SQLDatabaseWrapper } from "../../interfaces/data-sources/sql-database-wrapper";

const { v4: uuidv4 } = require('uuid');
const POSTGRES_DB = String(process.env.POSTGRES_DB);
const DB_TABLE = POSTGRES_DB + ".event_records";

export class PGEvent_recordsDataSource implements Event_recordsDataSource {

    private db: SQLDatabaseWrapper    

    constructor(db: SQLDatabaseWrapper) { 
        this.db = db  
    }

    async create(Event_records: Event_recordsRequestModel) {  
        const ID = uuidv4()    
        
        console.log(Event_records)

        await this.db.query(`insert into ${DB_TABLE} (id, collector_id, event_id, description) values ($1, $2, $3, $4)`, [ID, Event_records.collector_id, Event_records.event_id, Event_records.description])
    }

    async getAll(): Promise<Event_recordsResponseModel[]> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE}`)   
        const result = dbResponse.rows.map(item => ({
            id: item.id,
            collector_id: item.collector_id,
            event_id: item.event_id,
            registration_date: item.registration_date,
            description: item.description, 
            close_date: item.close_date, 
            status: item.status,         
        }));

        return result;
    }

    async getOne(id: String): Promise<Event_recordsResponseModel | boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }

        const result = dbResponse.rows.map(item => ({
            id: item.id,
            collector_id: item.collector_id,
            event_id: item.event_id,
            registration_date: item.registration_date,
            description: item.description,
            close_date: item.close_date,
            status: item.status,  
        }));
        return result[0];
    }

    async updateOne(id: String, data: Event_recordsRequestModel): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }     
        await this.db.query(`update ${DB_TABLE} set collector_id = $2, event_id = $3, description = $4, close_date = $5, status = $6 where id = $1`, [id, data.collector_id, data.event_id, data.description, data.close_date, data.status])
      
        return true;
    }

    async deleteOne(id: String): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }         
        await this.db.query(`delete from ${DB_TABLE} where id = $1`, [id])
     
        return true;
    } 

}