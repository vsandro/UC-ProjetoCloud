import { hash } from 'bcrypt';
import { prisma } from '../../../database/prisma';
interface ICreateUser {
  username: string;
  password: string;
  profile_id: string;
}
export class CreateUserModel {
  async execute({ username, password, profile_id }: ICreateUser) {
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

    const user = await prisma.users.create({
      data: {
        username,
        password: hashPassword,
        profile_id,
      },
    });
 
    return user;
  }
}
