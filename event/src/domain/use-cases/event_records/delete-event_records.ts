import { Event_recordsRepository } from "../../interfaces/repositories/event_records-repository";
import { DeleteEvent_recordsUseCase } from "../../interfaces/use-cases/event_records/delete-event_records-use-case";
export class DeleteEvent_records implements DeleteEvent_recordsUseCase {
    event_recordsRepository: Event_recordsRepository
    constructor(event_recordsRepository: Event_recordsRepository) {
        this.event_recordsRepository = event_recordsRepository
    }

    async execute(id: String): Promise<boolean> {
        const result = await this.event_recordsRepository.deleteEvent_records(id)
        return result;
    }
}