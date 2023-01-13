import { ItemRequestModel } from "../../../models/item";

export interface CreateItemUseCase {
    execute(item: ItemRequestModel): void;
}