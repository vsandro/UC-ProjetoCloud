import { CollectorRepository } from "../../interfaces/repositories/collector-repository";
import { DeleteCollectorUseCase } from "../../interfaces/use-cases/collector/delete-collector-use-case";
export class DeleteCollector implements DeleteCollectorUseCase {
    collectorRepository: CollectorRepository
    constructor(collectorRepository: CollectorRepository) {
        this.collectorRepository = collectorRepository
    }

    async execute(id: String): Promise<boolean> {
        const result = await this.collectorRepository.deleteCollector(id)
        return result;
    }
}