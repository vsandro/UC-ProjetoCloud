import { Request, Response } from 'express';
import { getAllStoresRegionModel } from './getAllStoresRegionModel';

export class getAllStoresRegionController {
  async handle(request: Request, response: Response) {

    const getAllStoresModel = new getAllStoresRegionModel();    
    const result = await getAllStoresModel.execute();

    return response.json(result);
  }
}