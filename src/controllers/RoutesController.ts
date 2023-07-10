import { Request, Response } from 'express';
import { Model } from '../model/Model'

export class RouteController {
    public model;

    constructor() {
        this.model = new Model();
    }

    getBestRoute = async (req: Request, res: Response): Promise<void> => {
        const { userId } = req.params;

        if (!userId.length) {
            // we do not accept requests without a user id
            res.status(400).json({ error: 'You must provide a user id'});
        } 

        try {
            // get best routes
            const routes = await this.model.getBestRoute(userId);
            res.json(routes);
        } catch (error) {
            // in case of an error we do not want to make the actuall error known to the world
            // but we still log it
            console.log('Failed to retrieve the best route', error);
            res.status(500).json({ error: 'Server error'});
        }
    }
}