import express, { Application, Response } from 'express';
import { RouteController } from './controllers/RoutesController';

const app: Application = express();
const port = 3000;

async function startServer() {
    try {

        // Define the controlers
        const routeController = new RouteController();

        // the route we want and will respond to
        app.get('/routes/:userId/best', routeController.getBestRoute);

        // start server and listen on port 3000
        app.listen(port, () => {
            console.log(`Server is listening on port ${port}`);
        });

    } catch (err) {
        console.log('Unable to connect to the database:', err);
    }
};

startServer();