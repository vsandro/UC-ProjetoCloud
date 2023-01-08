import express from 'express'
import { Request, Response } from 'express'
import { auth } from '../../middleware/auth';

import { CreateEvent_recordsUseCase } from '../../domain/interfaces/use-cases/event_records/create-event_records-use-case'
import { DeleteEvent_recordsUseCase } from '../../domain/interfaces/use-cases/event_records/delete-event_records-use-case'
import { GetAllEvent_recordsUseCase } from '../../domain/interfaces/use-cases/event_records/get-all-event_records-use-case'
import { GetOneEvent_recordsUseCase } from '../../domain/interfaces/use-cases/event_records/get-one-event_records-use-case'
import { UpdateEvent_recordsUseCase } from '../../domain/interfaces/use-cases/event_records/update-event_records-use-case'

export default function Event_recordsRouter(
    createEvent_recordsUseCase: CreateEvent_recordsUseCase,
    deleteEvent_recordsUseCase: DeleteEvent_recordsUseCase,
    getAllEvent_recordsUseCase: GetAllEvent_recordsUseCase,
    getOneEvent_recordsUseCase: GetOneEvent_recordsUseCase,
    updateEvent_recordsUseCase: UpdateEvent_recordsUseCase
) {
    const router = express.Router()
    console.log(`[event]` + '\x1b[32m', 'Event records Router on' + '\x1b[0m')

    router.post('/', auth, async (req: Request, res: Response) => {
        try {
            await createEvent_recordsUseCase.execute(req.body)
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
            const event_records = await getAllEvent_recordsUseCase.execute()
            res.send(event_records)
        } catch (err: any) {
            res.status(500).send({ message: "Error fetching data!!!" })
        }
    })

    router.get('/:id', auth, async (req: Request, res: Response) => {
        try {
            const event_records = await getOneEvent_recordsUseCase.execute(req.params.id)
            res.send(event_records)
        } catch (err:any) {
            res.status(500).send({ message: "Error fetching data!" })
        }
    })

    router.put('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await updateEvent_recordsUseCase.execute(req.params.id, req.body) 

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
            const result = await deleteEvent_recordsUseCase.execute(req.params.id)

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