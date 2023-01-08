import express from 'express'
import { Request, Response } from 'express'
import { auth } from '../../middleware/auth';

import { CreateCategoryUseCase } from '../../domain/interfaces/use-cases/category/create-category-use-case'
import { DeleteCategoryUseCase } from '../../domain/interfaces/use-cases/category/delete-category-use-case'
import { GetAllCategoryUseCase } from '../../domain/interfaces/use-cases/category/get-all-category-use-case'
import { GetOneCategoryUseCase } from '../../domain/interfaces/use-cases/category/get-one-category-use-case'
import { UpdateCategoryUseCase } from '../../domain/interfaces/use-cases/category/update-category-use-case'

export default function CategoryRouter(
    createCategoryUseCase: CreateCategoryUseCase,
    deleteCategoryUseCase: DeleteCategoryUseCase,
    getAllCategoryUseCase: GetAllCategoryUseCase,
    getOneCategoryUseCase: GetOneCategoryUseCase,
    updateCategoryUseCase: UpdateCategoryUseCase
) {
    const router = express.Router()
    console.log(`[core]` + '\x1b[32m', 'Categories Router on' + '\x1b[0m')

    router.post('/', auth, async (req: Request, res: Response) => {
        try {
            await createCategoryUseCase.execute(req.body)
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
            const category = await getAllCategoryUseCase.execute()
            res.send(category)
        } catch (err: any) {
            res.status(500).send({ message: "Error fetching data!!!" })
        }
    })

    router.get('/:id', auth, async (req: Request, res: Response) => {
        try {
            const category = await getOneCategoryUseCase.execute(req.params.id)
            res.send(category)
        } catch (err:any) {
            res.status(500).send({ message: "Error fetching data!" })
        }
    })

    router.put('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await updateCategoryUseCase.execute(req.params.id, req.body) 

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
            const result = await deleteCategoryUseCase.execute(req.params.id)

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