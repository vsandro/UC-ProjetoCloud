import { ItemRequestModel } from "../../models/item";
import { ItemRepository } from "../../interfaces/repositories/item-repository";
import { CreateItemUseCase } from "../../interfaces/use-cases/item/create-item-use-case";
export class CreateItem implements CreateItemUseCase {
    itemRepository: ItemRepository
    constructor(itemRepository: ItemRepository) {
        this.itemRepository = itemRepository
    }

    async execute(item: ItemRequestModel) {
        await this.itemRepository.createItem(item)
    }
}