import { Event_recordsResponseModel } from "../../../models/event_records";
export interface GetAllEvent_recordsUseCase {
    execute(): Promise<Event_recordsResponseModel[]>;
}