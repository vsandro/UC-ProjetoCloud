import { StoreRequestModel } from "../../../models/store";
export interface UpdateStoreUseCase {
    execute(id: String, data: StoreRequestModel): Promise<boolean>;
}