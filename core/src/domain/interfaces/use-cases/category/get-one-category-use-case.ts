import { CategoryResponseModel } from "../../../models/category";
export interface GetOneCategoryUseCase {
    execute(id: String): Promise<CategoryResponseModel | boolean>;
}