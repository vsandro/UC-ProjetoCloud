import { Router } from 'express';
import { auth } from './middlewares/auth';
import { getAllStoresRegionController } from './modules/stores/getAllStoresRegion/getAllStoresRegionController';
import { createOrdersController } from './modules/orders/createOrders/createOrdersController';
import { getOrdersUserController } from './modules/orders/getOrdersUser/getOrdersUserController';
import { getOrderItemsController } from './modules/orders/getOrderItems/getOrderItemsController';

const routes = Router();

const getAllStoresRegion = new getAllStoresRegionController();
const createOrders = new createOrdersController();
const getOrdersUser = new getOrdersUserController();
const getOrderItems = new getOrderItemsController();

routes.get('/stores/getAllStoresRegion', auth, getAllStoresRegion.handle);
routes.post('/orders/createOrder', auth, createOrders.handle);
routes.get('/orders/getOrdersUser/:userId', auth, getOrdersUser.handle);
routes.get('/orders/getOrderItems/:orderId', auth, getOrderItems.handle);

export { routes };
