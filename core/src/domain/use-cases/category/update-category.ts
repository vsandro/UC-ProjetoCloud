import { CategoryRepository } from "../../interfaces/repositories/category-repository";
import { UpdateCategoryUseCase } from "../../interfaces/use-cases/category/update-category-use-case";
import { CategoryRequestModel } from "../../models/category";
export class UpdateCategory implements UpdateCategoryUseCase {
    categoryRepository: CategoryRepository
    constructor(categoryRepository: CategoryRepository) {
        this.categoryRepository = categoryRepository
    }

    async execute(id: String, data: CategoryRequestModel): Promise<boolean> {
        const result = await this.categoryRepository.updateCategory(id, data)
        return result;
    }
}