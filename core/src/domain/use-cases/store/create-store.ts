import { StoreRequestModel } from "../../models/store";
import { StoreRepository } from "../../interfaces/repositories/store-repository";
import { CreateStoreUseCase } from "../../interfaces/use-cases/store/create-store-use-case";
export class CreateStore implements CreateStoreUseCase {
    storeRepository: StoreRepository
    constructor(storeRepository: StoreRepository) {
        this.storeRepository = storeRepository
    }

    async execute(store: StoreRequestModel) {
        await this.storeRepository.createStore(store)
    }
}