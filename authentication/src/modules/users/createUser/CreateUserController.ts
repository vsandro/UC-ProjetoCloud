import { Request, Response } from 'express';
import { CreateUserModel } from './CreateUserModel';
export class CreateUserController {
  async handle(request: Request, response: Response) {
    const { username, password, profile_id } = request.body;

    const createUserModel = new CreateUserModel();
    
    const result = await createUserModel.execute({
      username,
      password,
      profile_id,
    });

    return response.json(result);
  }
}
