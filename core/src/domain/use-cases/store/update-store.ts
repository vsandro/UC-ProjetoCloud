import { StoreRepository } from "../../interfaces/repositories/store-repository";
import { UpdateStoreUseCase } from "../../interfaces/use-cases/store/update-store-use-case";
import { StoreRequestModel } from "../../models/store";
export class UpdateStore implements UpdateStoreUseCase {
    storeRepository: StoreRepository
    constructor(storeRepository: StoreRepository) {
        this.storeRepository = storeRepository
    }

    async execute(id: String, data: StoreRequestModel): Promise<boolean> {
        const result = await this.storeRepository.updateStore(id, data)
        return result;
    }
}