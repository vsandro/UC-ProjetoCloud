import { Event_recordsRequestModel } from "../../../models/event_records";
export interface DeleteEvent_recordsUseCase {
    execute(id: String): Promise<boolean>;
}