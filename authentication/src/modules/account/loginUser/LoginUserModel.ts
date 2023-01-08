import { prisma } from '../../../database/prisma';
import { compare } from 'bcrypt';
import { sign } from 'jsonwebtoken';

import getClient from '../../../client/elasticsearch'
interface IAuthenticateUser {
  username: string;
  password: string;
}
export class AuthenticateUserModel {
  constructor(    
  ) {}
  
  async execute({ username, password }: IAuthenticateUser) {
    const user = await prisma.users.findFirst({
      where: {
        username,
      },
    });

    const clientElasticSearc = getClient()
   
    if (!user) {
      throw new Error('Username or password invalid!');   
    }    
    
    if (user.blocked) {
      console.log('Username ' + username + ' blocked! Contact your System Administrator.');            
      throw new Error('Username blocked! Contact your System Administrator.');   
    }

    const passwordMatch = await compare(password, user.password);

    if (!passwordMatch) {    
      // Criar um registro no elasticsearch
      const result = await clientElasticSearc.index({
        index: 'elastic_index_login',
        type: 'type_elastic_login',
        body: {
          username: username,
          message: "access denied",
          date: new Date()
        }
      });

      const countFailed = user.failed + 1

      //Requisito: Implementar um mecanismo de proteção contra brute-force
      if (countFailed === 3) {
        const updateUser = await prisma.users.update({
          where: {
            username,
          },
          data: {
            blocked: true,
          },
        })

        //Criar um registro no elasticsearch
        const result = await clientElasticSearc.index({
          index: 'elastic_index_login',
          type: 'type_elastic_login',
          body: {
            username: username,
            message: 'user blocked'  ,
            date: new Date()       
          }
        });  
              
      }

      const updateUser = await prisma.users.update({
        where: {
          username,
        },
        data: {
          failed: countFailed,
        },
      })
            
      throw new Error('Username or password invalid!');
    }

    // Requisito: Armazenar as credenciais de forma segura 
    const SECRET = String(process.env.SECRET_KEY)  
    const token = sign({ username }, SECRET, {
      subject: user.id,

      // Requisito: A autenticação deve expirar
      expiresIn: '1d', // Validade do TOKEN de acesso
    })

    const updateUser = await prisma.users.update({
      where: {
        username,
      },
      data: {
        failed: 0,
      },
    })          
     
    // Criar um registro no elasticsearch
    const result = await clientElasticSearc.index({
      index: 'elastic_index_login',
      type: 'type_elastic_login',
      body: {
        username: username,
        message: "authenticated",
        date: new Date()
      }
    });
    
    return token;
  }
}