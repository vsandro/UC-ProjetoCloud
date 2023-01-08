import { Router } from 'express';
import { auth } from './middlewares/auth';
import { AuthenticateUserController } from './modules/account/loginUser/LoginUserController';
import { UnlockUserController } from './modules/account/unlockUser/UnlockUserController';
import { CreateUserController } from './modules/users/createUser/CreateUserController';

const routes = Router();
const authenticateClientController = new AuthenticateUserController();

const unlockUserController = new UnlockUserController();
const createClientController = new CreateUserController();

routes.post('/user/login', authenticateClientController.handle);
routes.post('/user', auth, createClientController.handle);
routes.post('/user/unlock', auth, unlockUserController.handle);

export { routes };
