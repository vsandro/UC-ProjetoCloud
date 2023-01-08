import { Event_recordsDataSource } from "../../infrastructure/interfaces/data-sources/event_records/event_records-data-source";
import { Event_recordsRequestModel, Event_recordsResponseModel } from "../models/event_records";
import { Event_recordsRepository } from "../interfaces/repositories/event_records-repository";
export class Event_recordsRepositoryImpl implements Event_recordsRepository {
    event_recordsDataSource: Event_recordsDataSource

    constructor(event_recordsDataSource: Event_recordsDataSource) {
        this.event_recordsDataSource = event_recordsDataSource
    }

    async createEvent_records(event_records: Event_recordsRequestModel) {
        await this.event_recordsDataSource.create(event_records)
    }

    async getAllEvent_records(): Promise<Event_recordsResponseModel[]> {
        const result = await this.event_recordsDataSource.getAll()
        return result;
    }

    async getOneEvent_records(id: String): Promise<Event_recordsResponseModel | boolean> {
        const result = await this.event_recordsDataSource.getOne(id);
        return result;
    }  

    async updateEvent_records(id: String, data: Event_recordsRequestModel): Promise<boolean> {
        const result = await this.event_recordsDataSource.updateOne(id, data);
        return result;
    }
    
    async deleteEvent_records(id: String): Promise<boolean> {
        const result = await this.event_recordsDataSource.deleteOne(id)
        return result;
    }        
}