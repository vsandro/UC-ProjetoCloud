import { CollectorRequestModel, CollectorResponseModel } from "../../../../domain/models/collector";
export interface CollectorDataSource {
    create(collector: CollectorRequestModel): void;
    getAll(): Promise<CollectorResponseModel[]>;
    getOne(id: String): Promise<CollectorResponseModel | boolean>;
    updateOne(id: String, data: CollectorRequestModel): Promise<boolean>;
    deleteOne(id: String): Promise<boolean>;        
}