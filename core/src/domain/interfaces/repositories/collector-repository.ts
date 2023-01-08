import { CollectorRequestModel, CollectorResponseModel } from "../../models/collector";
export interface CollectorRepository {
    createCollector(collector: CollectorRequestModel): void;
    getCollectors(): Promise<CollectorResponseModel[]>;
    getCollector(id: String): Promise<CollectorResponseModel | boolean>;    
    updateCollector(id: String, data: CollectorRequestModel): Promise<boolean>;
    deleteCollector(id: String): Promise<boolean>;   
}