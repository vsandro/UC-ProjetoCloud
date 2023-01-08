import { CategoryResponseModel } from "../../models/category";
import { CategoryRepository } from "../../interfaces/repositories/category-repository";
import { GetAllCategoryUseCase } from "../../interfaces/use-cases/category/get-all-category-use-case";
export class GetAllCategory implements GetAllCategoryUseCase {
    categoryRepository: CategoryRepository
    constructor(categoryRepository: CategoryRepository) {
        this.categoryRepository = categoryRepository
    }

    async execute(): Promise<CategoryResponseModel[]> {
        const result = await this.categoryRepository.getAllCategory()
        return result
    }
}