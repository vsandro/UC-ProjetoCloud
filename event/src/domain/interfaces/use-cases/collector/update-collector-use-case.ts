import { CollectorRequestModel } from "../../../models/collector";
export interface UpdateCollectorUseCase {
    execute(id: String, data: CollectorRequestModel): Promise<boolean>;
}