import { prisma } from '../../../database/prisma';
export class getAllStoresRegionModel {
  async execute() {
 
    const result = await prisma.stores.findMany({ 
      where: {
        id_city: { in: [3, 4] },
      }   
    });       

  return result; 
  }
}