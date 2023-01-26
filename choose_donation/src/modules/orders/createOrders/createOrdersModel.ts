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
        required_date: '2023-01-17 10:08:00',
        status: 'C',
      },
    });

  return result; 
  }
}