import { EventRequestModel } from "../../models/event";
import { EventRepository } from "../../interfaces/repositories/event-repository";
import { CreateEventUseCase } from "../../interfaces/use-cases/event/create-event-use-case";
export class CreateEvent implements CreateEventUseCase {
    eventRepository: EventRepository
    constructor(eventRepository: EventRepository) {
        this.eventRepository = eventRepository
    }

    async execute(event: EventRequestModel) {
        await this.eventRepository.createEvent(event)
    }
}