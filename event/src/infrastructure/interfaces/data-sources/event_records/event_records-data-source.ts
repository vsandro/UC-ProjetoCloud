import { Event_recordsRequestModel, Event_recordsResponseModel } from "../../../../domain/models/event_records";
export interface Event_recordsDataSource {
    create(event_records: Event_recordsRequestModel): void;
    getAll(): Promise<Event_recordsResponseModel[]>;
    getOne(id: String): Promise<Event_recordsResponseModel | boolean>;
    updateOne(id: String, data: Event_recordsRequestModel): Promise<boolean>;
    deleteOne(id: String): Promise<boolean>;        
}