import { CategoryRequestModel, CategoryResponseModel } from "../../../../domain/models/category";
export interface CategoryDataSource {
    create(category: CategoryRequestModel): void;
    getAll(): Promise<CategoryResponseModel[]>;
    getOne(id: String): Promise<CategoryResponseModel | boolean>;
    updateOne(id: String, data: CategoryRequestModel): Promise<boolean>;
    deleteOne(id: String): Promise<boolean>;        
}