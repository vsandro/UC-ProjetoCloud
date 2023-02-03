import { prisma } from '../../../database/prisma';

interface ICreateOrder {
  user_id: string;
  store_id: string;
}

export class CreateOrdersModel {
  async execute({ user_id, store_id }: ICreateOrder) {
 
    const result = await prisma.orders.create({
      data: {
        user_id,
        store_id,
        required_date: '2023-02-03 10:06:00',
        status: 'C',
      },
    });

  return result; 
  }
}