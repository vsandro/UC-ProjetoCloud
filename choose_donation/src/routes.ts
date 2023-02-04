import { Router } from 'express';
import { auth } from './middlewares/auth';
import { GetAllStoresRegionController } from './modules/stores/getAllStoresRegion/getAllStoresRegionController';
import { CreateOrdersController } from './modules/orders/createOrders/createOrdersController';
import { GetOrdersUserController } from './modules/orders/getOrdersUser/getOrdersUserController';

const routes = Router();

const getAllStoresRegion = new GetAllStoresRegionController();
const createOrders = new CreateOrdersController();
const getOrdersUser = new GetOrdersUserController();

routes.get('/stores/getAllStoresRegion', getAllStoresRegion.handle);
routes.post('/orders/createOrder', createOrders.handle);
routes.get('/orders/getOrdersUser/:userId', getOrdersUser.handle);

export { routes };
