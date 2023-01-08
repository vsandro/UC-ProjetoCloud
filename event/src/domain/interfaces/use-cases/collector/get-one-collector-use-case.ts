import { CollectorResponseModel } from "../../../models/collector";
export interface GetOneCollectorUseCase {
    execute(id: String): Promise<CollectorResponseModel | boolean>;
}