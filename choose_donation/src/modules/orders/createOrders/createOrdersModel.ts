import { prisma } from '../../../database/prisma';

/**
 * createOrdersModel
 * 
 * Parametros de entrada: user_id, store_id, order_items
 * 
 * Esta classe cria uma nova ordem com seus respectivos itens e marca os itens selecionados como reserved = true.
 * Usa a biblioteca "prisma" para acesso ao banco de dados. 
 * Recebe como parametros as informações definidas na interface "ICreateOrder" 
 * Após criar a nova ordem com seus itens é retornado pela classe a order que foi gerada.
 * 
 * return result_order
 * 
 */
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
    
  // Retorna a Order criada
  return result_order; 
  }
}