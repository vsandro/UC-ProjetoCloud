import { EventRepository } from "../../interfaces/repositories/event-repository";
import { UpdateEventUseCase } from "../../interfaces/use-cases/event/update-event-use-case";
import { EventRequestModel } from "../../models/event";
export class UpdateEvent implements UpdateEventUseCase {
    eventRepository: EventRepository
    constructor(eventRepository: EventRepository) {
        this.eventRepository = eventRepository
    }

    async execute(id: String, data: EventRequestModel): Promise<boolean> {
        const result = await this.eventRepository.updateEvent(id, data)
        return result;
    }
}