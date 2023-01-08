import { StoreRequestModel, StoreResponseModel } from "../../models/store";
export interface StoreRepository {
    createStore(store: StoreRequestModel): void;
    getStores(): Promise<StoreResponseModel[]>;
    getStore(id: String): Promise<StoreResponseModel | boolean>;    
    updateStore(id: String, data: StoreRequestModel): Promise<boolean>;
    deleteStore(id: String): Promise<boolean>;   
}