import { Router } from 'express';
import { auth } from './middlewares/auth';
import { GetAllStoresRegionController } from './modules/stores/getAllStoresRegion/getAllStoresRegionController';
import { CreateOrdersController } from './modules/orders/createOrders/createOrdersController';

const routes = Router();

const getAllStoresRegion = new GetAllStoresRegionController();
const CreateOrders = new CreateOrdersController();

routes.get('/stores/getAllStoresRegion', getAllStoresRegion.handle);
routes.post('/orders/createOrder', CreateOrders.handle);

export { routes };
