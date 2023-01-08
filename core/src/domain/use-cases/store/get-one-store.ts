import { StoreResponseModel } from "../../models/store";
import { StoreRepository } from "../../interfaces/repositories/store-repository";
import { GetOneStoreUseCase } from "../../interfaces/use-cases/store/get-one-store-use-case";
export class GetOneStore implements GetOneStoreUseCase {
   storeRepository:StoreRepository
    constructor(storeRepository:StoreRepository) {
        this.storeRepository = storeRepository
    }

    async execute(id: String): Promise<StoreResponseModel | boolean> {
        const result = await this.storeRepository.getStore(id)
        return result
    }
}