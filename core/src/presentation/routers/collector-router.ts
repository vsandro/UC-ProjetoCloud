import express from 'express'
import { Request, Response } from 'express'
import { auth } from '../../middleware/auth';
import  axios  from 'axios'

import { CreateCollectorUseCase } from '../../domain/interfaces/use-cases/collector/create-collector-use-case'
import { DeleteCollectorUseCase } from '../../domain/interfaces/use-cases/collector/delete-collector-use-case'
import { GetAllCollectorsUseCase } from '../../domain/interfaces/use-cases/collector/get-all-collectors-use-case'
import { GetOneCollectorUseCase } from '../../domain/interfaces/use-cases/collector/get-one-collector-use-case'
import { UpdateCollectorUseCase } from '../../domain/interfaces/use-cases/collector/update-collector-use-case'

export default function CollectorsRouter(
    createCollectorUseCase: CreateCollectorUseCase,
    deleteCollectorUseCase: DeleteCollectorUseCase,
    getAllCollectorsUseCase: GetAllCollectorsUseCase,
    getOneCollectorUseCase: GetOneCollectorUseCase,
    updateCollectorUseCase: UpdateCollectorUseCase
) {
    const router = express.Router()
    console.log(`[core]` + '\x1b[32m', 'Collectors Router on' + '\x1b[0m')

    router.post('/', auth, async (req: Request, res: Response) => {
        try {
            await createCollectorUseCase.execute(req.body)
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
            const collectors = await getAllCollectorsUseCase.execute()
            res.send(collectors)
        } catch (err: any) {
            res.status(500).send({ message: "Error fetching data!!!" })
        }
    })

    router.get('/distritos', auth, async (req: Request, res: Response) => {
        try {
            const distritos = await axios.get("https://json.geoapi.pt/distritos")
            res.status(200).json(distritos.data)
        } catch (err: any) {
            console.log(err)
            res.status(500).send({ message: "Error fetching data distrito!!!" })
        }
    })

    router.get('/:id', auth, async (req: Request, res: Response) => {
        try {
            const collectors = await getOneCollectorUseCase.execute(req.params.id)
            res.send(collectors)
        } catch (err:any) {
            res.status(500).send({ message: "Error fetching data!" })
        }
    })

    router.put('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await updateCollectorUseCase.execute(req.params.id, req.body) 

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
            const result = await deleteCollectorUseCase.execute(req.params.id)

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