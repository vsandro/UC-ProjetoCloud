import { CategoryDataSource } from "../../infrastructure/interfaces/data-sources/category/category-data-source";
import { CategoryRequestModel, CategoryResponseModel } from "../models/category";
import { CategoryRepository } from "../interfaces/repositories/category-repository";
export class CategoryRepositoryImpl implements CategoryRepository {
    categoryDataSource: CategoryDataSource

    constructor(categoryDataSource: CategoryDataSource) {
        this.categoryDataSource = categoryDataSource
    }

    async createCategory(category: CategoryRequestModel) {
        await this.categoryDataSource.create(category)
    }

    async getAllCategory(): Promise<CategoryResponseModel[]> {
        const result = await this.categoryDataSource.getAll()
        return result;
    }

    async getOneCategory(id: String): Promise<CategoryResponseModel | boolean> {
        const result = await this.categoryDataSource.getOne(id);
        return result;
    }  

    async updateCategory(id: String, data: CategoryRequestModel): Promise<boolean> {
        const result = await this.categoryDataSource.updateOne(id, data);
        return result;
    }
    
    async deleteCategory(id: String): Promise<boolean> {
        const result = await this.categoryDataSource.deleteOne(id)
        return result;
    }        
}