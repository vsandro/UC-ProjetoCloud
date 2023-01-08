import { EventRequestModel, EventResponseModel } from "../../models/event";
export interface EventRepository {
    createEvent(event: EventRequestModel): void;
    getEvents(): Promise<EventResponseModel[]>;
    getEvent(id: String): Promise<EventResponseModel | boolean>;    
    updateEvent(id: String, data: EventRequestModel): Promise<boolean>;
    deleteEvent(id: String): Promise<boolean>;   
}