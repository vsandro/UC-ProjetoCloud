import server from './server'

import EventRouter from './presentation/routers/event-router'
import { EventRepositoryImpl } from './domain/repositories/event-repository'
import { CreateEvent } from './domain/use-cases/event/create-event'
import { DeleteEvent } from './domain/use-cases/event/delete-event'
import { GetAllEvents } from './domain/use-cases/event/get-all-events'
import { GetOneEvent } from './domain/use-cases/event/get-one-event'
import { UpdateEvent } from './domain/use-cases/event/update-event'

import CollectorRouter from './presentation/routers/collector-router'
import { CollectorRepositoryImpl } from './domain/repositories/collector-repository'
import { CreateCollector } from './domain/use-cases/collector/create-collector'
import { DeleteCollector } from './domain/use-cases/collector/delete-collector'
import { GetAllCollectors } from './domain/use-cases/collector/get-all-collectors'
import { GetOneCollector } from './domain/use-cases/collector/get-one-collector'
import { UpdateCollector } from './domain/use-cases/collector/update-collector'

import CategoryRouter from './presentation/routers/category-router'
import { CategoryRepositoryImpl } from './domain/repositories/category-repository'
import { CreateCategory } from './domain/use-cases/category/create-category'
import { DeleteCategory } from './domain/use-cases/category/delete-category'
import { GetAllCategory } from './domain/use-cases/category/get-all-category'
import { GetOneCategory } from './domain/use-cases/category/get-one-category'
import { UpdateCategory } from './domain/use-cases/category/update-category'

import StoreRouter from './presentation/routers/store-router'
import { StoreRepositoryImpl } from './domain/repositories/store-repository'
import { CreateStore } from './domain/use-cases/store/create-store'
import { DeleteStore } from './domain/use-cases/store/delete-store'
import { GetAllStores } from './domain/use-cases/store/get-all-store'
import { GetOneStore } from './domain/use-cases/store/get-one-store'
import { UpdateStore } from './domain/use-cases/store/update-store'

import ItemRouter from './presentation/routers/item-router'
import { ItemRepositoryImpl } from './domain/repositories/item-repository'
import { CreateItem } from './domain/use-cases/item/create-item'
import { DeleteItem } from './domain/use-cases/item/delete-item'
import { GetAllItem } from './domain/use-cases/item/get-all-item'
import { GetOneItem } from './domain/use-cases/item/get-one-item'
import { UpdateItem } from './domain/use-cases/item/update-item'

// import { NoSQLDatabaseWrapper } from './infrastructure/interfaces/data-sources/nosql-database-wrapper'
import { PGEventDataSource } from './infrastructure/data-sources/postgresql/pg-event-data-source'
import { PGCollectorDataSource } from './infrastructure/data-sources/postgresql/pg-collector-data-source'
import { PGCategoryDataSource } from './infrastructure/data-sources/postgresql/pg-category-data-source'
import { PGStoreDataSource } from './infrastructure/data-sources/postgresql/pg-store-data-source'
import { PGItemDataSource } from './infrastructure/data-sources/postgresql/pg-item-data-source'

import { Pool } from 'pg'

const PORT = process.env.PORT
const POSTGRES_USER = process.env.POSTGRES_USER
const POSTGRES_PASSWORD = process.env.POSTGRES_PASSWORD
const DB_HOST = process.env.DB_HOST
const POSTGRES_DB = process.env.POSTGRES_DB
const DB_PORT = Number(process.env.DB_PORT)

async function getEventPGDS() {

    const db = new Pool({
        user: POSTGRES_USER,
        password: POSTGRES_PASSWORD,
        host: DB_HOST,
        database: POSTGRES_DB,
        port: DB_PORT,
    })
    return new PGEventDataSource(db)
}

async function getCollectorPGDS() {

    const db = new Pool({
        user: POSTGRES_USER,
        password: POSTGRES_PASSWORD,
        host: DB_HOST,
        database: POSTGRES_DB,
        port: DB_PORT,
    })
    return new PGCollectorDataSource(db)
}

async function getCategoryPGDS() {

    const db = new Pool({
        user: POSTGRES_USER,
        password: POSTGRES_PASSWORD,
        host: DB_HOST,
        database: POSTGRES_DB,
        port: DB_PORT,
    })
    return new PGCategoryDataSource(db)
}

async function getStorePGDS() {

    const db = new Pool({
        user: POSTGRES_USER,
        password: POSTGRES_PASSWORD,
        host: DB_HOST,
        database: POSTGRES_DB,
        port: DB_PORT,
    })
    return new PGStoreDataSource(db)
}

async function getItemPGDS() {

    const db = new Pool({
        user: POSTGRES_USER,
        password: POSTGRES_PASSWORD,
        host: DB_HOST,
        database: POSTGRES_DB,
        port: DB_PORT,
    })
    return new PGItemDataSource(db)
}

(async () => {
    const dataSourceEvent = await getEventPGDS();
    
    const eventMiddleWare = EventRouter(        
        new CreateEvent(new EventRepositoryImpl(dataSourceEvent)),
        new DeleteEvent(new EventRepositoryImpl(dataSourceEvent)),
        new GetAllEvents(new EventRepositoryImpl(dataSourceEvent)),
        new GetOneEvent(new EventRepositoryImpl(dataSourceEvent)),
        new UpdateEvent(new EventRepositoryImpl(dataSourceEvent)),        
    )
    
    const dataSourceCollector = await getCollectorPGDS();

    const collectorMiddleWare = CollectorRouter(        
        new CreateCollector(new CollectorRepositoryImpl(dataSourceCollector)),
        new DeleteCollector(new CollectorRepositoryImpl(dataSourceCollector)),
        new GetAllCollectors(new CollectorRepositoryImpl(dataSourceCollector)),
        new GetOneCollector(new CollectorRepositoryImpl(dataSourceCollector)),
        new UpdateCollector(new CollectorRepositoryImpl(dataSourceCollector)),        
    )

    const dataSourceCategory = await getCategoryPGDS();

    const categoryMiddleWare = CategoryRouter(        
        new CreateCategory(new CategoryRepositoryImpl(dataSourceCategory)),
        new DeleteCategory(new CategoryRepositoryImpl(dataSourceCategory)),
        new GetAllCategory(new CategoryRepositoryImpl(dataSourceCategory)),
        new GetOneCategory(new CategoryRepositoryImpl(dataSourceCategory)),
        new UpdateCategory(new CategoryRepositoryImpl(dataSourceCategory)),        
    )

    const dataSourceStore = await getStorePGDS();

    const storeMiddleWare = StoreRouter(        
        new CreateStore(new StoreRepositoryImpl(dataSourceStore)),
        new DeleteStore(new StoreRepositoryImpl(dataSourceStore)),
        new GetAllStores(new StoreRepositoryImpl(dataSourceStore)),
        new GetOneStore(new StoreRepositoryImpl(dataSourceStore)),
        new UpdateStore(new StoreRepositoryImpl(dataSourceStore)),        
    )

    const dataSourceItem = await getItemPGDS();

    const itemMiddleWare = ItemRouter(        
        new CreateItem(new ItemRepositoryImpl(dataSourceItem)),
        new DeleteItem(new ItemRepositoryImpl(dataSourceItem)),
        new GetAllItem(new ItemRepositoryImpl(dataSourceItem)),
        new GetOneItem(new ItemRepositoryImpl(dataSourceItem)),
        new UpdateItem(new ItemRepositoryImpl(dataSourceItem)),        
    )

    const swaggerUi = require('swagger-ui-express'),
    swaggerDocument = require('./swagger.json');

    server.use('/api-docs',
        swaggerUi.serve, 
        swaggerUi.setup(swaggerDocument)
    );

    server.use("/event", eventMiddleWare)
    server.use("/collector", collectorMiddleWare)
    server.use("/category", categoryMiddleWare)
    server.use("/store", storeMiddleWare)
    server.use("/item", itemMiddleWare)
    
    server.listen(PORT, () => {
        console.log("[core]" + "\x1b[34m" + " Server running" + "\x1b[0m" + " on port " + PORT);
      });
})()
