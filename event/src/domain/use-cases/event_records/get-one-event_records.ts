import { Event_recordsResponseModel } from "../../models/event_records";
import { Event_recordsRepository } from "../../interfaces/repositories/event_records-repository";
import { GetOneEvent_recordsUseCase } from "../../interfaces/use-cases/event_records/get-one-event_records-use-case";
export class GetOneEvent_records implements GetOneEvent_recordsUseCase {
   event_recordsRepository:Event_recordsRepository
    constructor(event_recordsRepository:Event_recordsRepository) {
        this.event_recordsRepository = event_recordsRepository
    }

    async execute(id: String): Promise<Event_recordsResponseModel | boolean> {
        const result = await this.event_recordsRepository.getOneEvent_records(id)
        return result
    }
}