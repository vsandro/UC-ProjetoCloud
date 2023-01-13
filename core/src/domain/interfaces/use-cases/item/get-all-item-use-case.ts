import { ItemResponseModel } from "../../../models/item";
export interface GetAllItemUseCase {
    execute(): Promise<ItemResponseModel[]>;
}