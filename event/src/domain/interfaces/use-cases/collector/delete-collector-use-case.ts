import { CollectorRequestModel } from "../../../models/collector";
export interface DeleteCollectorUseCase {
    execute(id: String): Promise<boolean>;
}