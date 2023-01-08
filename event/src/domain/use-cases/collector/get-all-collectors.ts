import { CollectorResponseModel } from "../../models/collector";
import { CollectorRepository } from "../../interfaces/repositories/collector-repository";
import { GetAllCollectorsUseCase } from "../../interfaces/use-cases/collector/get-all-collectors-use-case";
export class GetAllCollectors implements GetAllCollectorsUseCase {
    collectorRepository: CollectorRepository
    constructor(collectorRepository: CollectorRepository) {
        this.collectorRepository = collectorRepository
    }

    async execute(): Promise<CollectorResponseModel[]> {
        const result = await this.collectorRepository.getCollectors()
        return result
    }
}