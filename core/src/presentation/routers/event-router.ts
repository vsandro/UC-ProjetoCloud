import express from 'express'
import { Request, Response } from 'express'
import { auth } from '../../middleware/auth';

import { CreateEventUseCase } from '../../domain/interfaces/use-cases/event/create-event-use-case'
import { DeleteEventUseCase } from '../../domain/interfaces/use-cases/event/delete-event-use-case'
import { GetAllEventsUseCase } from '../../domain/interfaces/use-cases/event/get-all-events-use-case'
import { GetOneEventUseCase } from '../../domain/interfaces/use-cases/event/get-one-event-use-case'
import { UpdateEventUseCase } from '../../domain/interfaces/use-cases/event/update-event-use-case'

export default function EventsRouter(
    createEventUseCase: CreateEventUseCase,
    deleteEventUseCase: DeleteEventUseCase,
    getAllEventsUseCase: GetAllEventsUseCase,
    getOneEventUseCase: GetOneEventUseCase,
    updateEventUseCase: UpdateEventUseCase
) {
    const router = express.Router()
    console.log(`[core]` + '\x1b[32m', 'Events Router on' + '\x1b[0m')

    router.post('/', auth, async (req: Request, res: Response) => {
        try {
            await createEventUseCase.execute(req.body)
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
            const events = await getAllEventsUseCase.execute()
            res.send(events)
        } catch (err: any) {
            res.status(500).send({ message: "Error fetching data!!!" })
        }
    })

    router.get('/:id', auth, async (req: Request, res: Response) => {
        try {
            const events = await getOneEventUseCase.execute(req.params.id)
            res.send(events)
        } catch (err:any) {
            res.status(500).send({ message: "Error fetching data!" })
        }
    })

    router.put('/:id', auth, async (req: Request, res: Response) => {
        try {
            const result = await updateEventUseCase.execute(req.params.id, req.body) 

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
            const result = await deleteEventUseCase.execute(req.params.id)

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