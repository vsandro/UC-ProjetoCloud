import { ItemResponseModel } from "../../models/item";
import { ItemRepository } from "../../interfaces/repositories/item-repository";
import { GetAllItemUseCase } from "../../interfaces/use-cases/item/get-all-item-use-case";
export class GetAllItem implements GetAllItemUseCase {
    itemRepository: ItemRepository
    constructor(itemRepository: ItemRepository) {
        this.itemRepository = itemRepository
    }

    async execute(): Promise<ItemResponseModel[]> {
        const result = await this.itemRepository.getAllItem()
        return result
    }
}