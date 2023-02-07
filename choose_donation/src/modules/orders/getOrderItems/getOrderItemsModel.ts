import { prisma } from '../../../database/prisma';

interface IOrderItems {
  order_id: string;
}

export class getOrderItemsModel {
  async execute({ order_id }: IOrderItems) {

    const result = await prisma.order_items.findMany({ 
      where: {
        AND: [ 
          { order_id: order_id}
        ]        
      }   
    });       

  return result; 
  }
}
