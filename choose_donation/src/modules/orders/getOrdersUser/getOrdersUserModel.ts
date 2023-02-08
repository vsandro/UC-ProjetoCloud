import { prisma } from '../../../database/prisma';

interface IOrder {
  user_id: string;
}

// Este é um modelo de código para obter as encomendas de um usuário específico utilizando o Prisma. Ele implementa uma interface IOrder que espera um ID de usuário como entrada, e retorna todas as encomendas com o status "O" (Ordered) associadas a esse usuário. O método prisma.orders.findMany é usado para consultar as encomendas no banco de dados, onde a condição de busca é a combinação dos ID do usuário e o status "O".

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
