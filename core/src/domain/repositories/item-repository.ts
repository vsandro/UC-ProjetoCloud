import { ItemDataSource } from "../../infrastructure/interfaces/data-sources/item/item-data-source";
import { ItemRequestModel, ItemResponseModel } from "../models/item";
import { ItemRepository } from "../interfaces/repositories/item-repository";
export class ItemRepositoryImpl implements ItemRepository {
    itemDataSource: ItemDataSource

    constructor(itemDataSource: ItemDataSource) {
        this.itemDataSource = itemDataSource
    }

    async createItem(item: ItemRequestModel) {
        await this.itemDataSource.create(item)
    }

    async getAllItem(): Promise<ItemResponseModel[]> {
        const result = await this.itemDataSource.getAll()
        return result;
    }

    async getOneItem(id: String): Promise<ItemResponseModel | boolean> {
        const result = await this.itemDataSource.getOne(id);
        return result;
    }  

    async updateItem(id: String, data: ItemRequestModel): Promise<boolean> {
        const result = await this.itemDataSource.updateOne(id, data);
        return result;
    }
    
    async deleteItem(id: String): Promise<boolean> {
        const result = await this.itemDataSource.deleteOne(id)
        return result;
    }        
}