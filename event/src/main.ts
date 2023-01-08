import createMQConsumer from '../src/application-rabbitmq/consumer'
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

import Event_recordsRouter from './presentation/routers/event_records-router'
import { Event_recordsRepositoryImpl } from './domain/repositories/event_records-repository'
import { CreateEvent_records } from './domain/use-cases/event_records/create-event_records'
import { DeleteEvent_records } from './domain/use-cases/event_records/delete-event_records'
import { GetAllEvent_records } from './domain/use-cases/event_records/get-all-event_records'
import { GetOneEvent_records } from './domain/use-cases/event_records/get-one-event_records'
import { UpdateEvent_records } from './domain/use-cases/event_records/update-event_records'

// import { NoSQLDatabaseWrapper } from './infrastructure/interfaces/data-sources/nosql-database-wrapper'
import { PGEventDataSource } from './infrastructure/data-sources/postgresql/pg-event-data-source'
import { PGCollectorDataSource } from './infrastructure/data-sources/postgresql/pg-collector-data-source'
import { PGEvent_recordsDataSource } from './infrastructure/data-sources/postgresql/pg-event_records-data-source'

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

async function getEvent_recordsPGDS() {

    const db = new Pool({
        user: POSTGRES_USER,
        password: POSTGRES_PASSWORD,
        host: DB_HOST,
        database: POSTGRES_DB,
        port: DB_PORT,
    })
    return new PGEvent_recordsDataSource(db)
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

    const dataSourceEvent_records = await getEvent_recordsPGDS();

    const event_recordsMiddleWare = Event_recordsRouter(        
        new CreateEvent_records(new Event_recordsRepositoryImpl(dataSourceEvent_records)),
        new DeleteEvent_records(new Event_recordsRepositoryImpl(dataSourceEvent_records)),
        new GetAllEvent_records(new Event_recordsRepositoryImpl(dataSourceEvent_records)),
        new GetOneEvent_records(new Event_recordsRepositoryImpl(dataSourceEvent_records)),
        new UpdateEvent_records(new Event_recordsRepositoryImpl(dataSourceEvent_records)),        
    )

    const swaggerUi = require('swagger-ui-express'),
    swaggerDocument = require('./swagger.json');

    server.use('/api-docs',
        swaggerUi.serve, 
        swaggerUi.setup(swaggerDocument)
    );

    server.use("/event", eventMiddleWare)
    server.use("/collector", collectorMiddleWare)
    server.use("/eventrecords", event_recordsMiddleWare)

    const SERVER = String(process.env.SERVER_HABBIT)

    const consumerEvents = createMQConsumer(SERVER, "core.events");
    const consumerCollectors = createMQConsumer(SERVER, "core.collectors");

    consumerEvents();
    consumerCollectors();
    
    server.listen(PORT, () => {
        console.log("[event]" + "\x1b[34m" + " Server running" + "\x1b[0m" + " on port " + PORT);
      });
})()
