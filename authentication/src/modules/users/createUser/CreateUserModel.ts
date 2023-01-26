/**
 * CreateUser
 * 
 * Este código é uma classe de modelo que cria um novo usuário.
 * Ele importa a biblioteca "bcrypt" para criptografar a senha do usuário
 * e usa a biblioteca "prisma" para acessar ao banco de dados. 
 * Ele define uma interface chamada "ICreateUser" que especifica os campos necessários para criar um novo usuário. 
 * O método "execute" da classe verifica se o nome de usuário já existe no banco de dados. 
 * Se existir, ele lança um erro. 
 * Se não existir, ele criptografa a senha e cria um novo usuário e retorna o usuário criado para quem chamou a classe
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