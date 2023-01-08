import { EventRequestModel } from "../../../models/event";
export interface DeleteEventUseCase {
    execute(id: String): Promise<boolean>;
}