import { CategoryRequestModel } from "../../../models/category";
export interface UpdateCategoryUseCase {
    execute(id: String, data: CategoryRequestModel): Promise<boolean>;
}