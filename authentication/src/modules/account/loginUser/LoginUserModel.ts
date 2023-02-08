import { prisma } from '../../../database/prisma';
import { compare } from 'bcrypt';
import { sign } from 'jsonwebtoken';
import getClient from '../../../client/elasticsearch'

/**
 * AuthenticateUserModel
 * 
 * Parametros de entrada: username, password
 * 
 * O código é uma classe que representa a lógica de autenticação de um utilizador.
 * Usa a biblioteca "bcrypt" para compara a senha fornecida com a senha armazenada no banco de dados.
 * Usa a biblioteca "prisma" para acesso ao banco de dados. 
 * Recebe como parametros as informações definidas na interface "IAuthenticateUser" 
 * Se a senha for válida, o código gera um token JWT usando o método sign do pacote jsonwebtoken. 
 * O token é assinado com a chave secreta armazenada em uma variável de ambiente chamada SECRET_KEY e contém o nome de usuário como payload. 
 * O token tem um tempo de expiração de 24 horas.
 * Se o nome de usuário ou a senha não forem válidos, o código aumenta o contador de tentativas falhas para o usuário e, se esse contador chegar a 3, bloqueia o usuário. 
 * Além disso, o código registra informações sobre o acesso (como o nome de usuário, a data e hora e se o acesso foi bem-sucedido ou negado) no Elasticsearch.
 * 
 * return token
 * 
 */
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

      // Implementar um mecanismo de proteção contra brute-force
      if (countFailed === 3) {
        const updateUser = await prisma.users.update({
          where: {
            username,
          },
          data: {
            blocked: true,
          },
        })

        // Criar um registro no elasticsearch
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

    // Armazena as credenciais de forma segura 
    const SECRET = String(process.env.SECRET_KEY)  
    const token = sign({ username }, SECRET, {
      subject: user.id,

      // A autenticação deve expirar em um tempo determinado
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
    
    // Retorna um Token valido
    return token;
  }
}