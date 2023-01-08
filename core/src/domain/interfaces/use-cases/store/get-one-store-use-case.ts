import { StoreResponseModel } from "../../../models/store";
export interface GetOneStoreUseCase {
    execute(id: String): Promise<StoreResponseModel | boolean>;
}