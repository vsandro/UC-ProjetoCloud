import { prisma } from '../../../database/prisma';
import getClient from '../../../client/elasticsearch'

/**
 * UnlockUserModel
 * 
 * Parametros de entrada: username
 * 
 * Esta classe desbloqueia um utilizador.
 * Usa a biblioteca "prisma" para acesso ao banco de dados. 
 * Recebe como parametros as informações definidas na interface "IUnlockUser" 
 * Verificar se o utilizador está bloqueado, informando se ele não estiver. 
 * Se ele estiver bloqueado, faz o desbloqueo e adiciona um registo no Elasticsearch como log. 
 * 
 * return true
 * 
 */
interface IUnlockUser {
  username: string;
}
export class UnlockUserModel {
  constructor(
   
  ) {}
  
  async execute({ username }: IUnlockUser) {

    const clientElasticSearc = getClient()
    
    const user = await prisma.users.findFirst({
      where: {
        username,
      },
    });
   
    if (!user) {
      throw new Error('Username invalid!');   
    }    
    
    if (!user.blocked) {
      console.log('user ' + username + ' not blocked');
      throw new Error('user ' + username + ' not blocked'); 
    }

    if (user.blocked) {
      console.log('unlocked user ' + username ); 
      // Criar um registro no elasticsearch
      const result = await clientElasticSearc.index({
        index: 'elastic_index_login',
        type: 'type_elastic_login',
        body: {
          username: username,
          message: "unlocked user",
          date: new Date()
        }
      });      
    } 
 
    return true
  }

  // Desbloqueia o utilizador no banco de dados
  async update({ username }: IUnlockUser) {
    const updateUser = await prisma.users.update({
      where: {
        username,
      },
      data: {
        blocked: false,
        failed: 0,
      },
    })
  } 

}