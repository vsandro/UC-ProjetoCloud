import { Request, Response } from 'express';
import { AuthenticateUserModel } from './LoginUserModel';
export class AuthenticateUserController {
  async handle(request: Request, response: Response) {
    const { username, password } = request.body;

    const authenticateUserModel = new AuthenticateUserModel();
    
    const result = await authenticateUserModel.execute({
      username,
      password,
    });

    return response.json(result);
  }
}
