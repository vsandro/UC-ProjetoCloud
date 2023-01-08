import { CategoryRequestModel } from "../../../models/category";
export interface DeleteCategoryUseCase {
    execute(id: String): Promise<boolean>;
}