import { Event_recordsResponseModel } from "../../../models/event_records";
export interface GetOneEvent_recordsUseCase {
    execute(id: String): Promise<Event_recordsResponseModel | boolean>;
}