import { EventRequestModel } from "../../../models/event";
export interface UpdateEventUseCase {
    execute(id: String, data: EventRequestModel): Promise<boolean>;
}