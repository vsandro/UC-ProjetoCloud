import { CollectorResponseModel } from "../../models/collector";
import { CollectorRepository } from "../../interfaces/repositories/collector-repository";
import { GetOneCollectorUseCase } from "../../interfaces/use-cases/collector/get-one-collector-use-case";
export class GetOneCollector implements GetOneCollectorUseCase {
   collectorRepository:CollectorRepository
    constructor(collectorRepository:CollectorRepository) {
        this.collectorRepository = collectorRepository
    }

    async execute(id: String): Promise<CollectorResponseModel | boolean> {
        const result = await this.collectorRepository.getCollector(id)
        return result
    }
}