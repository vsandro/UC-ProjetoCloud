import { EventRequestModel } from "../../../models/event";
export interface CreateEventUseCase {
    execute(event: EventRequestModel): void;
}