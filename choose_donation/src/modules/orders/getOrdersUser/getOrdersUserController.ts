import { Request, Response } from 'express';
import { getOrdersUserModel } from './getOrdersUserModel';

export class getOrdersUserController {
  async handle(request: Request, response: Response) {

    const { userId } = request.params;

    const GetOrdersUserModel = new getOrdersUserModel();
    
    const result = await GetOrdersUserModel.execute({
      user_id: userId
    });

    return response.json(result);
  }
}