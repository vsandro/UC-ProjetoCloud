import { Event_recordsRequestModel, Event_recordsResponseModel } from "../../models/event_records";
export interface Event_recordsRepository {
    createEvent_records(cvent_records: Event_recordsRequestModel): void;
    getAllEvent_records(): Promise<Event_recordsResponseModel[]>;
    getOneEvent_records(id: String): Promise<Event_recordsResponseModel | boolean>;    
    updateEvent_records(id: String, data: Event_recordsRequestModel): Promise<boolean>;
    deleteEvent_records(id: String): Promise<boolean>;   
}