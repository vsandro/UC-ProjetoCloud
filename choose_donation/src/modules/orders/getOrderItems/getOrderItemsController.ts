import { Request, Response } from 'express';
import { getOrderItemsModel } from './getOrderItemsModel';

export class getOrderItemsController {
  async handle(request: Request, response: Response) {

    const { orderId } = request.params;

    const GetOrderItemsModel = new getOrderItemsModel();
    
    const result = await GetOrderItemsModel.execute({
      order_id: orderId
    });

    return response.json(result);
  }
}