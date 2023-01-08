import { EventResponseModel } from "../../../models/event";
export interface GetAllEventsUseCase {
    execute(): Promise<EventResponseModel[]>;
}