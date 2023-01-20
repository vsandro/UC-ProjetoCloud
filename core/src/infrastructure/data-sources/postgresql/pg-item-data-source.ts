import createMQProducer from '../../../application-rabbitmq/producer'
import { ItemRequestModel, ItemResponseModel } from "../../../domain/models/item";
import { ItemDataSource } from "../../interfaces/data-sources/item/item-data-source";

// import { SQLDatabaseWrapper } from "../../interfaces/data-sources/nosql-database-wrapper";
import { SQLDatabaseWrapper } from "../../interfaces/data-sources/sql-database-wrapper";

const { v4: uuidv4 } = require('uuid');
const POSTGRES_DB = String(process.env.POSTGRES_DB);
const DB_TABLE = POSTGRES_DB + ".items";
const SERVER = String(process.env.SERVER_HABBIT)
const QUEUE = "core.items"

const producer = createMQProducer(SERVER, QUEUE)
export class PGItemDataSource implements ItemDataSource {

    private db: SQLDatabaseWrapper    

    constructor(db: SQLDatabaseWrapper) { 
        this.db = db  
    }

    async create(Item: ItemRequestModel) {  
        const ID = uuidv4()    
        
        console.log(Item)

        await this.db.query(`insert into ${DB_TABLE} (id, description, category_id) values ($1, $2, $3)`, [ID, Item.description, Item.category_id])

        const jsonSend = JSON.stringify({
            id: ID,
            description: Item.description,
            category_id: Item.category_id,
            type: "item created",
        })
        producer(jsonSend)
    }

    async getAll(): Promise<ItemResponseModel[]> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE}`)   
        const result = dbResponse.rows.map(item => ({
            id: item.id,
            description: item.description,
            active: item.active,
            category_id: item.category_id,
            reserved: item.reserved,
        }));

        return result;
    }

    async getOne(id: String): Promise<ItemResponseModel | boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }

        const result = dbResponse.rows.map(item => ({
            id: item.id,
            description: item.description,
            active: item.active,
            category_id: item.category_id,
            reserved: item.reserved,
        }));
        return result[0];
    }

    async updateOne(id: String, data: ItemRequestModel): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }     
        await this.db.query(`update ${DB_TABLE} set description = $2, active = $3, category_id = $4, reserved = $5 where id = $1`, [id, data.description, data.active, data.category_id, data.reserved])

        const jsonSend = JSON.stringify({
            id: id,
            description: data.description,
            category_id: data.category_id,
            type: "item updated",
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
            description: dbResponse.rows[0].description,
            type: "item deleted",
        })
        producer(jsonSend)
     
        return true;
    } 

}