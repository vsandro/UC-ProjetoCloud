import { ItemRepository } from "../../interfaces/repositories/item-repository";
import { UpdateItemUseCase } from "../../interfaces/use-cases/item/update-item-use-case";
import { ItemRequestModel } from "../../models/item";
export class UpdateItem implements UpdateItemUseCase {
    itemRepository: ItemRepository
    constructor(itemRepository: ItemRepository) {
        this.itemRepository = itemRepository
    }

    async execute(id: String, data: ItemRequestModel): Promise<boolean> {
        const result = await this.itemRepository.updateItem(id, data)
        return result;
    }
}