import { Event_recordsResponseModel } from "../../models/event_records";
import { Event_recordsRepository } from "../../interfaces/repositories/event_records-repository";
import { GetAllEvent_recordsUseCase } from "../../interfaces/use-cases/event_records/get-all-event_records-use-case";
export class GetAllEvent_records implements GetAllEvent_recordsUseCase {
    event_recordsRepository: Event_recordsRepository
    constructor(event_recordsRepository: Event_recordsRepository) {
        this.event_recordsRepository = event_recordsRepository
    }

    async execute(): Promise<Event_recordsResponseModel[]> {
        const result = await this.event_recordsRepository.getAllEvent_records()
        return result
    }
}