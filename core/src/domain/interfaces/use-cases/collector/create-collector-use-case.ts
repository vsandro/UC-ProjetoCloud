import { CollectorRequestModel } from "../../../models/collector";
export interface CreateCollectorUseCase {
    execute(collector: CollectorRequestModel): void;
}