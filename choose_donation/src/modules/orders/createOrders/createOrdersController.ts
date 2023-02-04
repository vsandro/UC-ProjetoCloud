import { Request, Response } from 'express';
import { CreateOrdersModel } from './createOrdersModel';

export class CreateOrdersController {
  async handle(request: Request, response: Response) {

    const { user_id, store_id, order_items } = request.body;

    const createOrdersModel = new CreateOrdersModel();
    
    const result = await createOrdersModel.execute({
      user_id,
      store_id,
      order_items,
    });

    return response.json(result);
  }
}