import { CategoryRequestModel, CategoryResponseModel } from "../../models/category";
export interface CategoryRepository {
    createCategory(category: CategoryRequestModel): void;
    getAllCategory(): Promise<CategoryResponseModel[]>;
    getOneCategory(id: String): Promise<CategoryResponseModel | boolean>;    
    updateCategory(id: String, data: CategoryRequestModel): Promise<boolean>;
    deleteCategory(id: String): Promise<boolean>;   
}