import { EventRequestModel, EventResponseModel } from "../../../../domain/models/event";
export interface EventDataSource {
    create(event: EventRequestModel): void;
    getAll(): Promise<EventResponseModel[]>;
    getOne(id: String): Promise<EventResponseModel | boolean>;
    updateOne(id: String, data: EventRequestModel): Promise<boolean>;
    deleteOne(id: String): Promise<boolean>;        
}