import { prisma } from '../../../database/prisma';

interface IOrder {
  user_id: string;
}

export class getOrdersUserModel {
  async execute({ user_id }: IOrder) {

    const result = await prisma.orders.findMany({ 
      where: {
        AND: [ 
          {user_id,},
          {status: "O"}
        ]        
      }   
    });       

  return result; 
  }
}
