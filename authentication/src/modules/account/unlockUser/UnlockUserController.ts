import { Request, Response } from 'express';
import { UnlockUserModel } from './UnlockUserModel';
export class UnlockUserController {
  async handle(request: Request, response: Response) {
    const { username } = request.body;

    const unlockUserModel = new UnlockUserModel();
    
    const result = await unlockUserModel.execute({
      username,
    });

    if (result) {
      await unlockUserModel.update({
        username,
      });
      return response.json({return: "unlocked user"});
    }
    return response.json({return: "Ok"});
  }
}
