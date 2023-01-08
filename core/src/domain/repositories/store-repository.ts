import { StoreDataSource } from "../../infrastructure/interfaces/data-sources/store/store-data-source";
import { StoreRequestModel, StoreResponseModel } from "../models/store";
import { StoreRepository } from "../interfaces/repositories/store-repository";
export class StoreRepositoryImpl implements StoreRepository {
    storeDataSource: StoreDataSource

    constructor(storeDataSource: StoreDataSource) {
        this.storeDataSource = storeDataSource
    }

    async createStore(store: StoreRequestModel) {
        await this.storeDataSource.create(store)
    }

    async getStores(): Promise<StoreResponseModel[]> {
        const result = await this.storeDataSource.getAll()
        return result;
    }

    async getStore(id: String): Promise<StoreResponseModel | boolean> {
        const result = await this.storeDataSource.getOne(id);
        return result;
    }  

    async updateStore(id: String, data: StoreRequestModel): Promise<boolean> {
        const result = await this.storeDataSource.updateOne(id, data);
        return result;
    }
    
    async deleteStore(id: String): Promise<boolean> {
        const result = await this.storeDataSource.deleteOne(id)
        return result;
    }        
}