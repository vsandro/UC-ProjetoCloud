import { CategoryResponseModel } from "../../../models/category";
export interface GetAllCategoryUseCase {
    execute(): Promise<CategoryResponseModel[]>;
}