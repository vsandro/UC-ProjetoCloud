import { Event_recordsRequestModel } from "../../../models/event_records";
export interface UpdateEvent_recordsUseCase {
    execute(id: String, data: Event_recordsRequestModel): Promise<boolean>;
}