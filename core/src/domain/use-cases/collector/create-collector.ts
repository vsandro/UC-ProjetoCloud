import { CollectorRequestModel } from "../../models/collector";
import { CollectorRepository } from "../../interfaces/repositories/collector-repository";
import { CreateCollectorUseCase } from "../../interfaces/use-cases/collector/create-collector-use-case";
export class CreateCollector implements CreateCollectorUseCase {
    collectorRepository: CollectorRepository
    constructor(collectorRepository: CollectorRepository) {
        this.collectorRepository = collectorRepository
    }

    async execute(collector: CollectorRequestModel) {
        await this.collectorRepository.createCollector(collector)
    }
}