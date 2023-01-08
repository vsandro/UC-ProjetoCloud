import { StoreRepository } from "../../interfaces/repositories/store-repository";
import { DeleteStoreUseCase } from "../../interfaces/use-cases/store/delete-store-use-case";
export class DeleteStore implements DeleteStoreUseCase {
    storeRepository: StoreRepository
    constructor(storeRepository: StoreRepository) {
        this.storeRepository = storeRepository
    }

    async execute(id: String): Promise<boolean> {
        const result = await this.storeRepository.deleteStore(id)
        return result;
    }
}