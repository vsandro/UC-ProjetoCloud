import { CategoryRepository } from "../../interfaces/repositories/category-repository";
import { DeleteCategoryUseCase } from "../../interfaces/use-cases/category/delete-category-use-case";
export class DeleteCategory implements DeleteCategoryUseCase {
    categoryRepository: CategoryRepository
    constructor(categoryRepository: CategoryRepository) {
        this.categoryRepository = categoryRepository
    }

    async execute(id: String): Promise<boolean> {
        const result = await this.categoryRepository.deleteCategory(id)
        return result;
    }
}