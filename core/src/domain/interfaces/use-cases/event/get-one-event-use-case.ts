import { EventResponseModel } from "../../../models/event";
export interface GetOneEventUseCase {
    execute(id: String): Promise<EventResponseModel | boolean>;
}