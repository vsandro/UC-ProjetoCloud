import { ItemRequestModel, ItemResponseModel } from "../../../../domain/models/item";
export interface ItemDataSource {
    create(item: ItemRequestModel): void;
    getAll(): Promise<ItemResponseModel[]>;
    getOne(id: String): Promise<ItemResponseModel | boolean>;
    updateOne(id: String, data: ItemRequestModel): Promise<boolean>;
    deleteOne(id: String): Promise<boolean>;        
}