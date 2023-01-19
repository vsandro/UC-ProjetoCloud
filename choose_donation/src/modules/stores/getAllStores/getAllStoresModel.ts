import { prisma } from '../../../database/prisma';


export class GetAllStoresModel {
  async execute() {
 
    const stores = await prisma.stores.findMany({
 
    });
        
  return stores; 
  }
}