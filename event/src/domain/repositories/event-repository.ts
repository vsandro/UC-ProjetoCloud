import { EventDataSource } from "../../infrastructure/interfaces/data-sources/event/event-data-source";
import { EventRequestModel, EventResponseModel } from "../models/event";
import { EventRepository } from "../interfaces/repositories/event-repository";
export class EventRepositoryImpl implements EventRepository {
    eventDataSource: EventDataSource

    constructor(eventDataSource: EventDataSource) {
        this.eventDataSource = eventDataSource
    }

    async createEvent(event: EventRequestModel) {
        await this.eventDataSource.create(event)
    }

    async getEvents(): Promise<EventResponseModel[]> {
        const result = await this.eventDataSource.getAll()
        return result;
    }

    async getEvent(id: String): Promise<EventResponseModel | boolean> {
        const result = await this.eventDataSource.getOne(id);
        return result;
    }  

    async updateEvent(id: String, data: EventRequestModel): Promise<boolean> {
        const result = await this.eventDataSource.updateOne(id, data);
        return result;
    }
    
    async deleteEvent(id: String): Promise<boolean> {
        const result = await this.eventDataSource.deleteOne(id)
        return result;
    }        
}