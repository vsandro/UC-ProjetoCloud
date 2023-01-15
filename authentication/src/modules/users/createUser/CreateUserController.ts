import { Request, Response } from 'express';
import { CreateUserModel } from './CreateUserModel';
export class CreateUserController {
  async handle(request: Request, response: Response) {
    const { profile_id, username, password, name, address, phone, email } = request.body;
    // const { profile_id, username, password } = request.body;

    const createUserModel = new CreateUserModel();
    
    const result = await createUserModel.execute({
      profile_id,
      username,
      password,      
      name,
      address,
      phone,
      email,
    });

    return response.json(result);
  }
}
