import createMQProducer from '../../../../src/application-rabbitmq/producer'
import { StoreRequestModel, StoreResponseModel } from "../../../domain/models/store";
import { StoreDataSource } from "../../interfaces/data-sources/store/store-data-source";
// import { SQLDatabaseWrapper } from "../../interfaces/data-sources/nosql-database-wrapper";
import { SQLDatabaseWrapper } from "../../interfaces/data-sources/sql-database-wrapper";

const { v4: uuidv4 } = require('uuid');
const POSTGRES_DB = String(process.env.POSTGRES_DB);
const DB_TABLE = POSTGRES_DB + ".stores";
const SERVER = String(process.env.SERVER_HABBIT)
const QUEUE = "core.stores"

const producer = createMQProducer(SERVER, QUEUE)
export class PGStoreDataSource implements StoreDataSource {

    private db: SQLDatabaseWrapper    

    constructor(db: SQLDatabaseWrapper) { 
        this.db = db  
    }

    async create(Store: StoreRequestModel) {  
        const ID = uuidv4()     
        await this.db.query(`insert into ${DB_TABLE} (id, name, address, latitude, longitude) values ($1, $2, $3, $4, $5)`, [ID, Store.name, Store.address, Store.latitude, Store.longitude])

        const jsonSend = JSON.stringify({
                  id: ID,
                  name: Store.name,
                  address: Store.address,
                  latitude: Store.latitude,
                  longitude: Store.longitude,
                  active: Store.active,
                  type: "store created",
        })
        producer(jsonSend)
    }

    async getAll(): Promise<StoreResponseModel[]> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE}`)   
        const result = dbResponse.rows.map(item => ({
            id: item.id,
            name: item.name,
            address: item.address,
            latitude: item.latitude,
            longitude: item.longitude,
            active: item.active,
        }));
        return result;
    }

    async getOne(id: String): Promise<StoreResponseModel | boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }

        const result = dbResponse.rows.map(item => ({
            id: item.id,
            name: item.name,
            address: item.address,
            latitude: item.latitude,
            longitude: item.longitude,
            active: item.active,   
        }));
        return result[0];
    }

    async updateOne(id: String, data: StoreRequestModel): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }     
        await this.db.query(`update ${DB_TABLE} set  name = $2, address = $3, latitude = $4, longitude = $5, active = $6 where id = $1`, [id, data.name, data.address, data.latitude, data.longitude, data.active])

        const jsonSend = JSON.stringify({
            id: id,
            name: data.name,
            active: data.active,                
            type: "store updated",
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
            type: "store deleted",
        })
        producer(jsonSend)               
        return true;
    } 

}