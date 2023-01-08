import { StoreRequestModel } from "../../../models/store";
export interface CreateStoreUseCase {
    execute(store: StoreRequestModel): void;
}