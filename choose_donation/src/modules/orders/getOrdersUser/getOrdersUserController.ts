import { Request, Response } from 'express';
import { GetOrdersUserModel } from './getOrdersUserModel';

export class GetOrdersUserController {
  async handle(request: Request, response: Response) {

    const { userId } = request.params;

    const getOrdersUserModel = new GetOrdersUserModel();
    
    const result = await getOrdersUserModel.execute({
      user_id: userId,
    });

    return response.json(result);
  }
}