import { CollectorResponseModel } from "../../../models/collector";
export interface GetAllCollectorsUseCase {
    execute(): Promise<CollectorResponseModel[]>;
}