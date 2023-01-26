import { Request, Response } from 'express';
import { CreateOrdersModel } from './createOrdersModel';

export class CreateOrdersController {
  async handle(request: Request, response: Response) {

    const { user_id, store_id } = request.body;

    const createOrdersModel = new CreateOrdersModel();
    
    const result = await createOrdersModel.execute({
      user_id,
      store_id,
    });

    return response.json(result);
  }
}