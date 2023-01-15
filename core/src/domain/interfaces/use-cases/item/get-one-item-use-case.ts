import { ItemResponseModel } from "../../../models/item";
export interface GetOneItemUseCase {
    execute(id: String): Promise<ItemResponseModel | boolean>;
}