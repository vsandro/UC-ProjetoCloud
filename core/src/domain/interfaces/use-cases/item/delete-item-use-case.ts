import { ItemRequestModel } from "../../../models/item";
export interface DeleteItemUseCase {
    execute(id: String): Promise<boolean>;
}