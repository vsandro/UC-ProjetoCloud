import { StoreResponseModel } from "../../../models/store";
export interface GetAllStoresUseCase {
    execute(): Promise<StoreResponseModel[]>;
}