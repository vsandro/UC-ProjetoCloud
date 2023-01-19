import { Request, Response } from 'express';
import { GetAllStoresModel } from './getAllStoresModel';

export class GetAllStoresController {
  async handle(request: Request, response: Response) {
    const { listCategoriesID } = request.body;

    const getAllStoresModel = new GetAllStoresModel();
    
    const result = await getAllStoresModel.execute();

    return response.json(result);
  }
}