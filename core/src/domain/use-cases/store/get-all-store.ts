import { StoreResponseModel } from "../../models/store";
import { StoreRepository } from "../../interfaces/repositories/store-repository";
import { GetAllStoresUseCase } from "../../interfaces/use-cases/store/get-all-stores-use-case";
export class GetAllStores implements GetAllStoresUseCase {
    storeRepository: StoreRepository
    constructor(storeRepository: StoreRepository) {
        this.storeRepository = storeRepository
    }

    async execute(): Promise<StoreResponseModel[]> {
        const result = await this.storeRepository.getStores()
        return result
    }
}