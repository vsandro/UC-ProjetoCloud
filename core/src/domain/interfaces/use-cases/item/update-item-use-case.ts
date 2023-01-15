import { ItemRequestModel } from "../../../models/item";
export interface UpdateItemUseCase {
    execute(id: String, data: ItemRequestModel): Promise<boolean>;
}