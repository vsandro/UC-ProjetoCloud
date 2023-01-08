import { EventResponseModel } from "../../models/event";
import { EventRepository } from "../../interfaces/repositories/event-repository";
import { GetOneEventUseCase } from "../../interfaces/use-cases/event/get-one-event-use-case";
export class GetOneEvent implements GetOneEventUseCase {
   eventRepository:EventRepository
    constructor(eventRepository:EventRepository) {
        this.eventRepository = eventRepository
    }

    async execute(id: String): Promise<EventResponseModel | boolean> {
        const result = await this.eventRepository.getEvent(id)
        return result
    }
}