import express from 'express'
import { Request, Response } from 'express'
import { auth } from '../../middleware/auth';

import { CreateStoreUseCase } from '../../domain/interfaces/use-cases/store/create-store-use-case'
import { DeleteStoreUseCase } from '../../domain/interfaces/use-cases/store/delete-store-use-case'
import { GetAllStoresUseCase } from '../../domain/interfaces/use-cases/store/get-all-stores-use-case'
import { GetOneStoreUseCase } from '../../domain/interfaces/use-cases/store/get-one-store-use-case'
import { UpdateStoreUseCase } from '../../domain/interfaces/use-cases/store/update-store-use-case'

export default function StoresRouter(
    createStoreUseCase: CreateStoreUseCase,
    deleteStoreUseCase: DeleteStoreUseCase,
    getAllStoresUseCase: GetAllStoresUseCase,
    getOneStoreUseCase: GetOneStoreUseCase,
    updateStoreUseCase: UpdateStoreUseCase
) {
    const router = express.Router()
    console.log(`[core]` + '\x1b[32m', 'Stores Router on' + '\x1b[0m')

    router.post('/', auth, async (req: Request, res: Response) => {
        try {
            await createStoreUseCase.execute(req.body)
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
            const stores = await getAllStoresUseCase.execute()
            res.send(stores)
        } catch (err: any) {
            res.status(500).send({ message: "Error fetching data!!!" })
        }
    })

    router.get('/:id', auth, async (req: Request, res: Response) => {
        try {
            const stores = await getOneStoreUseCase.execute(req.params.id)
            res.send(stores)
        } catch (err:any) {
            res.status(500).send({ message: "Error fetching data!" })
        }
    })

    router.put('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await updateStoreUseCase.execute(req.params.id, req.body) 

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
            const result = await deleteStoreUseCase.execute(req.params.id)

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