import { CategoryRequestModel } from "../../models/category";
import { CategoryRepository } from "../../interfaces/repositories/category-repository";
import { CreateCategoryUseCase } from "../../interfaces/use-cases/category/create-category-use-case";
export class CreateCategory implements CreateCategoryUseCase {
    categoryRepository: CategoryRepository
    constructor(categoryRepository: CategoryRepository) {
        this.categoryRepository = categoryRepository
    }

    async execute(category: CategoryRequestModel) {
        await this.categoryRepository.createCategory(category)
    }
}