import { CategoryResponseModel } from "../../models/category";
import { CategoryRepository } from "../../interfaces/repositories/category-repository";
import { GetOneCategoryUseCase } from "../../interfaces/use-cases/category/get-one-category-use-case";
export class GetOneCategory implements GetOneCategoryUseCase {
   categoryRepository:CategoryRepository
    constructor(categoryRepository:CategoryRepository) {
        this.categoryRepository = categoryRepository
    }

    async execute(id: String): Promise<CategoryResponseModel | boolean> {
        const result = await this.categoryRepository.getOneCategory(id)
        return result
    }
}