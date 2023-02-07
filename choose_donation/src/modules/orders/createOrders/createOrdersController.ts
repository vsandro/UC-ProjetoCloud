import { Request, Response } from 'express';
import { createOrdersModel } from './createOrdersModel';

export class createOrdersController {
  async handle(request: Request, response: Response) {

    const { user_id, store_id, order_items } = request.body;

    const CreateOrdersModel = new createOrdersModel();
    
    const result = await CreateOrdersModel.execute({
      user_id,
      store_id,
      order_items,
    });

    return response.json(result);
  }
}