import { Event_recordsRequestModel } from "../../../models/event_records";

export interface CreateEvent_recordsUseCase {
    execute(event_records: Event_recordsRequestModel): void;
}