import { Request, Response } from 'express';
import { GetAllStoresRegionModel } from './getAllStoresRegionModel';

export class GetAllStoresRegionController {
  async handle(request: Request, response: Response) {

    const getAllStoresModel = new GetAllStoresRegionModel();    
    const result = await getAllStoresModel.execute();

    return response.json(result);
  }
}