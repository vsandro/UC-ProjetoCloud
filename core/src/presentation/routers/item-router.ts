import express from 'express'
import { Request, Response } from 'express'
import { auth } from '../../middleware/auth';

import { CreateItemUseCase } from '../../domain/interfaces/use-cases/item/create-item-use-case'
import { DeleteItemUseCase } from '../../domain/interfaces/use-cases/item/delete-item-use-case'
import { GetAllItemUseCase } from '../../domain/interfaces/use-cases/item/get-all-item-use-case'
import { GetOneItemUseCase } from '../../domain/interfaces/use-cases/item/get-one-item-use-case'
import { UpdateItemUseCase } from '../../domain/interfaces/use-cases/item/update-item-use-case'

export default function ItemRouter(
    createItemUseCase: CreateItemUseCase,
    deleteItemUseCase: DeleteItemUseCase,
    getAllItemUseCase: GetAllItemUseCase,
    getOneItemUseCase: GetOneItemUseCase,
    updateItemUseCase: UpdateItemUseCase
) {
    const router = express.Router()
    console.log(`[core]` + '\x1b[32m', 'Items Router on' + '\x1b[0m')

    router.post('/', auth, async (req: Request, res: Response) => {
        try {
            await createItemUseCase.execute(req.body)
            res.statusCode = 201
            res.json({ message: "Created" })
        } catch (err: any) {
            console.log(err.message)
            res.status(500).send({ 
                warning: "Error saving data",
                message: err.message
            })
        }
    })

    router.get('/', auth, async (req: Request, res: Response) => {
        try {
            const item = await getAllItemUseCase.execute()
            res.send(item)
        } catch (err: any) {
            res.status(500).send({ message: "Error fetching data!!!" })
        }
    })

    router.get('/:id', auth, async (req: Request, res: Response) => {
        try {
            const item = await getOneItemUseCase.execute(req.params.id)
            res.send(item)
        } catch (err:any) {
            res.status(500).send({ message: "Error fetching data!" })
        }
    })

    router.put('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await updateItemUseCase.execute(req.params.id, req.body) 

            if (result) {
                res.statusCode = 201
                res.json({ message: "Updated" })
            } else {
                res.statusCode = 201
                res.json({ message: "Not found" })           
            }

        } catch (err:any) {        
            console.log(err.message)
            res.status(500).send({ 
                warning: "Error saving data",
                message: err.message
            })    
        }
    })

    router.delete('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await deleteItemUseCase.execute(req.params.id)

            if (result) {
                res.statusCode = 201
                res.json({ message: "Deleted" })
            } else {
                res.statusCode = 201
                res.json({ message: "Not found" })           
            }
        } catch (err:any) {
            console.log(err.message)
            res.status(500).send({ message: "Error when deleting" })
        }
    })
    
    return router
}