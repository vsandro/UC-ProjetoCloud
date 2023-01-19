import { Router } from 'express';
import { auth } from './middlewares/auth';

import { GetAllStoresController} from './modules/stores/getAllStores/getAllStoresController';

const routes = Router();

const getAllStores = new GetAllStoresController();


routes.get('/stores/getAllStores', getAllStores.handle);

export { routes };
