import { prisma } from '../../../database/prisma';
interface ICreateOrder {
  user_id: string;
  store_id: string;
  order_items: string;
}
export class createOrdersModel {
  async execute({ user_id, store_id, order_items }: ICreateOrder) {
 
    const result_order = await prisma.orders.create({
      data: {
        user_id,
        store_id,
        required_date: new Date(),
        status: 'O',
      },
    });

    const ID = result_order.id
    
    for (let i = 0; i < order_items.length; i++) {
      const element = order_items[i];
      
      // Cria os itens da order
      const result_order_items = await prisma.order_items.create({
        data: {
          order_id: ID,
          item_id: order_items[i],
        },
      });

      // Marca os itens como reserved = true
      const result_items = await prisma.items.update({
        where: {
          id: order_items[i],
        },
        data: {
          reserved: true,
        },
      })

    } 
    
  return result_order; 
  }
}