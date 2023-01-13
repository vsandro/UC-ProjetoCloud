import { ItemRequestModel, ItemResponseModel } from "../../models/item";
export interface ItemRepository {
    createItem(item: ItemRequestModel): void;
    getAllItem(): Promise<ItemResponseModel[]>;
    getOneItem(id: String): Promise<ItemResponseModel | boolean>;    
    updateItem(id: String, data: ItemRequestModel): Promise<boolean>;
    deleteItem(id: String): Promise<boolean>;   
}