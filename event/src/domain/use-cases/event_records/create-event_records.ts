import { Event_recordsRequestModel } from "../../models/event_records";
import { Event_recordsRepository } from "../../interfaces/repositories/event_records-repository";
import { CreateEvent_recordsUseCase } from "../../interfaces/use-cases/event_records/create-event_records-use-case";
export class CreateEvent_records implements CreateEvent_recordsUseCase {
    event_recordsRepository: Event_recordsRepository
    constructor(event_recordsRepository: Event_recordsRepository) {
        this.event_recordsRepository = event_recordsRepository
    }

    async execute(event_records: Event_recordsRequestModel) {
        await this.event_recordsRepository.createEvent_records(event_records)
    }
}