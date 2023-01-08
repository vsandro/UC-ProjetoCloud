import { EventRepository } from "../../interfaces/repositories/event-repository";
import { DeleteEventUseCase } from "../../interfaces/use-cases/event/delete-event-use-case";
export class DeleteEvent implements DeleteEventUseCase {
    eventRepository: EventRepository
    constructor(eventRepository: EventRepository) {
        this.eventRepository = eventRepository
    }

    async execute(id: String): Promise<boolean> {
        const result = await this.eventRepository.deleteEvent(id)
        return result;
    }
}