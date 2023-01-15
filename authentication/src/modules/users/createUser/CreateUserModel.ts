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
    // async execute({ profile_id, username, password }: ICreateUser) {
    const userExists = await prisma.users.findFirst({
      where: {
        username: {
          equals: username,
          mode: 'insensitive',
        },
      },
    });

    if (userExists) {
      throw new Error('user already exists');
    }

    const hashPassword = await hash(password, 10);

    // console.log(username, name, phone)

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
 
    return user;
  }
}
