import { prisma } from '../../../database/prisma';


export class GetAllStoresRegionModel {
  async execute() {
 
    const result = await prisma.stores.findMany({ 
      where: {
        id_city: { in: [4, 6] },
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