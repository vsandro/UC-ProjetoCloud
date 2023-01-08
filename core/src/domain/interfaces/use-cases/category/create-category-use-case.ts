import { CategoryRequestModel } from "../../../models/category";

export interface CreateCategoryUseCase {
    execute(category: CategoryRequestModel): void;
}