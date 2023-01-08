import { EventResponseModel } from "../../models/event";
import { EventRepository } from "../../interfaces/repositories/event-repository";
import { GetAllEventsUseCase } from "../../interfaces/use-cases/event/get-all-events-use-case";
export class GetAllEvents implements GetAllEventsUseCase {
    eventRepository: EventRepository
    constructor(eventRepository: EventRepository) {
        this.eventRepository = eventRepository
    }

    async execute(): Promise<EventResponseModel[]> {
        const result = await this.eventRepository.getEvents()
        return result
    }
}