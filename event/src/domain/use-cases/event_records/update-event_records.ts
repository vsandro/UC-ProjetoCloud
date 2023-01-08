import { Event_recordsRepository } from "../../interfaces/repositories/event_records-repository";
import { UpdateEvent_recordsUseCase } from "../../interfaces/use-cases/event_records/update-event_records-use-case";
import { Event_recordsRequestModel } from "../../models/event_records";
export class UpdateEvent_records implements UpdateEvent_recordsUseCase {
    event_recordsRepository: Event_recordsRepository
    constructor(event_recordsRepository: Event_recordsRepository) {
        this.event_recordsRepository = event_recordsRepository
    }

    async execute(id: String, data: Event_recordsRequestModel): Promise<boolean> {
        const result = await this.event_recordsRepository.updateEvent_records(id, data)
        return result;
    }
}