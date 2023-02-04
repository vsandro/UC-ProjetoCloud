import { prisma } from '../../../database/prisma';
export class GetAllStoresRegionModel {
  async execute() {
 
    const result = await prisma.stores.findMany({ 
      where: {
        id_city: { in: [4, 6] },
      }   
    });       

  return result; 
  }
}