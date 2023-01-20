import { prisma } from '../../../database/prisma';


export class GetAllStoresModel {
  async execute() {
 
    const result = await prisma.stores.findMany({ 
      where: {
        id: { in: ["35f80b90-cb05-48ed-a0a7-c5f6dc00287d", "d3c88e53-1c47-4fdd-96f8-5e15cd738b28"] },
      }   
    });
       
    // const result = await prisma.store_items.findUnique({
    //   where: {
    //     store_id: "35f80b90-cb05-48ed-a0a7-c5f6dc00287d",
    //   },
    //   include: {
    //     items: true, // All items where store_id
    //   },
    // });

  return result; 
  }
}