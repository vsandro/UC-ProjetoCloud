import { StoreRequestModel } from "../../../models/store";
export interface DeleteStoreUseCase {
    execute(id: String): Promise<boolean>;
}