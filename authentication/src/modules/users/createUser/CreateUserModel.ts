/**
 * CreateUserModel
 * 
 * Parametros de entrada: profile_id, username, password, name, address, phone, email
 * 
 * Esta classe cria um novo utilizador.
 * Usa a biblioteca "bcrypt" para criptografar a senha do utilizador
 * Usa a biblioteca "prisma" para acesso ao banco de dados. 
 * Recebe como parametros as informações definidas na interface "ICreateUser" 
 * com todos os campos necessários para criar um novo utilizador.
 * O método "execute" da classe verifica se o nome de usuário já existe no banco de dados. 
 * Se existir, ele lança um erro. 
 * Se não existir, ele criptografa a senha, cria um novo utilizador.
 * Os dados do novo utilizador é retornado pela classe
 * 
 * return user
 * 
 */

import { hash } from 'bcrypt';
import { prisma } from '../../../database/prisma';
interface ICreateUser {
  profile_id: string;
  username: string;
  password: string;  
  name: string;
  address: string;
  phone: string;
  email: string;
}
export class CreateUserModel {
  async execute({ profile_id, username, password, name, address, phone, email }: ICreateUser) {
    const userExists = await prisma.users.findFirst({
      where: {
        username: {
          equals: username,
          mode: 'insensitive',
        },
      },
    });

    // Verifica se o usuário já existe
    if (userExists) {
      throw new Error('user already exists');
    }

    // Criptografa a senha passada antes de gravar no banco de dados
    const hashPassword = await hash(password, 10);

    // Criação do usuário no banco de dados
    const user = await prisma.users.create({
      data: {
        profile_id,
        username,
        password: hashPassword, 
        blocked: false,
        failed: 0,
        name,
        address,
        phone,
        email,
      },
    });
 
    // Retorna o usuário criando
    return user;
  }
}