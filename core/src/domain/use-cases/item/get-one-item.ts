import { ItemResponseModel } from "../../models/item";
import { ItemRepository } from "../../interfaces/repositories/item-repository";
import { GetOneItemUseCase } from "../../interfaces/use-cases/item/get-one-item-use-case";
export class GetOneItem implements GetOneItemUseCase {
   itemRepository:ItemRepository
    constructor(itemRepository:ItemRepository) {
        this.itemRepository = itemRepository
    }

    async execute(id: String): Promise<ItemResponseModel | boolean> {
        const result = await this.itemRepository.getOneItem(id)
        return result
    }
}