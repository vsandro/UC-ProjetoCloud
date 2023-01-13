import { ItemRepository } from "../../interfaces/repositories/item-repository";
import { DeleteItemUseCase } from "../../interfaces/use-cases/item/delete-item-use-case";
export class DeleteItem implements DeleteItemUseCase {
    itemRepository: ItemRepository
    constructor(itemRepository: ItemRepository) {
        this.itemRepository = itemRepository
    }

    async execute(id: String): Promise<boolean> {
        const result = await this.itemRepository.deleteItem(id)
        return result;
    }
}