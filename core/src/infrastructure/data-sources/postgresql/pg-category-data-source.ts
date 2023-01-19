import createMQProducer from '../../../../src/application-rabbitmq/producer'
import { CategoryRequestModel, CategoryResponseModel } from "../../../domain/models/category";
import { CategoryDataSource } from "../../interfaces/data-sources/category/category-data-source";

// import { SQLDatabaseWrapper } from "../../interfaces/data-sources/nosql-database-wrapper";
import { SQLDatabaseWrapper } from "../../interfaces/data-sources/sql-database-wrapper";

const { v4: uuidv4 } = require('uuid');
const POSTGRES_DB = String(process.env.POSTGRES_DB);
const DB_TABLE = POSTGRES_DB + ".categories";
const SERVER = String(process.env.SERVER_HABBIT)
const QUEUE = "core.categories"

const producer = createMQProducer(SERVER, QUEUE)
export class PGCategoryDataSource implements CategoryDataSource {

    private db: SQLDatabaseWrapper    

    constructor(db: SQLDatabaseWrapper) { 
        this.db = db  
    }

    async create(Category: CategoryRequestModel) {  
        const ID = uuidv4()    
        
        console.log(Category)

        await this.db.query(`insert into ${DB_TABLE} (id, name) values ($1, $2)`, [ID, Category.name])

        const jsonSend = JSON.stringify({
            id: ID,
            name: Category.name,
            type: "category created",
        })
        producer(jsonSend)
    }

    async getAll(): Promise<CategoryResponseModel[]> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE}`)   
        const result = dbResponse.rows.map(item => ({
            id: item.id,
            name: item.name,
            active: item.active,
        }));

        return result;
    }

    async getOne(id: String): Promise<CategoryResponseModel | boolean> {
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

    async updateOne(id: String, data: CategoryRequestModel): Promise<boolean> {
        const dbResponse = await this.db.query(`select * from ${DB_TABLE} where id = $1 limit 1`, [id])

        if (dbResponse.rows.length === 0) {
            console.log("Not found");
            return false;
        }     
        await this.db.query(`update ${DB_TABLE} set name = $2, active = $3 where id = $1`, [id, data.name, data.active])

        const jsonSend = JSON.stringify({
            id: id,
            name: data.name,
            type: "category updated",
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
            type: "category deleted",
        })
        producer(jsonSend)
     
        return true;
    } 

}