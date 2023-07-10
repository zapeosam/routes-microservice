import { Route } from '../entities/Route';
import { DataSource, Repository } from 'typeorm';

export class RouteService {
    private routeRepository: Repository<Route>;
    
    constructor(dataSource: DataSource) {
        this.routeRepository = dataSource.getRepository(Route);
    }

    async getRoutes(whereConditions: any, orderBy: any , limit: number): Promise<Route[]> {
        let routes: Route[] = [];

        try {
            routes = await this.routeRepository.find({
                where: whereConditions,
                order: orderBy,
                take: limit
            }) as [Route];
        } catch (err) {
            console.log('Failed to retrieve route', err);
        }
        return routes;
    }
}