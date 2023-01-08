import { CollectorDataSource } from "../../infrastructure/interfaces/data-sources/collector/collector-data-source";
import { CollectorRequestModel, CollectorResponseModel } from "../models/collector";
import { CollectorRepository } from "../interfaces/repositories/collector-repository";
export class CollectorRepositoryImpl implements CollectorRepository {
    collectorDataSource: CollectorDataSource

    constructor(collectorDataSource: CollectorDataSource) {
        this.collectorDataSource = collectorDataSource
    }

    async createCollector(collector: CollectorRequestModel) {
        await this.collectorDataSource.create(collector)
    }

    async getCollectors(): Promise<CollectorResponseModel[]> {
        const result = await this.collectorDataSource.getAll()
        return result;
    }

    async getCollector(id: String): Promise<CollectorResponseModel | boolean> {
        const result = await this.collectorDataSource.getOne(id);
        return result;
    }  

    async updateCollector(id: String, data: CollectorRequestModel): Promise<boolean> {
        const result = await this.collectorDataSource.updateOne(id, data);
        return result;
    }
    
    async deleteCollector(id: String): Promise<boolean> {
        const result = await this.collectorDataSource.deleteOne(id)
        return result;
    }        
}