import { StoreRequestModel, StoreResponseModel } from "../../../../domain/models/store";
export interface StoreDataSource {
    create(store: StoreRequestModel): void;
    getAll(): Promise<StoreResponseModel[]>;
    getOne(id: String): Promise<StoreResponseModel | boolean>;
    updateOne(id: String, data: StoreRequestModel): Promise<boolean>;
    deleteOne(id: String): Promise<boolean>;        
}