import { CollectorRepository } from "../../interfaces/repositories/collector-repository";
import { UpdateCollectorUseCase } from "../../interfaces/use-cases/collector/update-collector-use-case";
import { CollectorRequestModel } from "../../models/collector";
export class UpdateCollector implements UpdateCollectorUseCase {
    collectorRepository: CollectorRepository
    constructor(collectorRepository: CollectorRepository) {
        this.collectorRepository = collectorRepository
    }

    async execute(id: String, data: CollectorRequestModel): Promise<boolean> {
        const result = await this.collectorRepository.updateCollector(id, data)
        return result;
    }
}