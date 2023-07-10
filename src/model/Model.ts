import * as orm from "typeorm"
import { RouteService } from '../services/RoutesService';
import { UserService } from '../services/UsersService';
import { UserToRouteTypeService } from '../services/UserToRouteTypeService';
import { Route } from '../entities/Route';
import { User } from '../entities/User';
import { UserToRouteType } from '../entities/UserToRouteType';

export class Model {
    public routeService: RouteService;
    public userService: UserService;
    public userToRouteTypeService: UserToRouteTypeService;
    private db: orm.DataSource;
    
    constructor () {
        // below information should be stored in
        // a secret place for example in AWS Secrets Manager if this ended up being a lambda function
        // change acces info to whatever matches the host, user, password, ... where this will be run
        this.db = new orm.DataSource({
            type: 'postgres',
            host: 'localhost',
            port: 5432,
            username: 'postgres',
            password: 'postgres',
            database: 'routes',
            entities: [Route, User, UserToRouteType],
            synchronize: false,
        });
        // initialise db
        this.initialiseDb();
        // initialise services
        this.routeService = new RouteService(this.db);
        this.userService = new UserService(this.db);
        this.userToRouteTypeService = new UserToRouteTypeService(this.db);
    }
    
    async initialiseDb() {
        // initialise the DB connection
        this.db.initialize()
            .then(() => {})
            .catch((err) => {
                console.error("Error during Data Source initialization", err)
            });
    }

    async getBestRoute(userId: string): Promise<Route[]> {
        let routes: Route[] = [];

        try {
            // get user
            // this could be returned by a user microservice instead of it being read directly from db
            const user = await this.userService.getUserById(userId) as User;
            if (user) {       
                // if user exists we continue

                // we want just 1 result -- the best
                const limit = 1;
                // order conditions we want
                const orderBy = {
                    traffic_level: "ASC",
                    cost: "ASC"
                };
                // where conditions for the query
                const whereConditions = {} as any;

                // if the user has a limit set then set a where condition for it
                if (user.cost_limit) {
                    whereConditions.cost = orm.LessThanOrEqual(user.cost_limit);
                }

                // get allowed routes for the user
                // this could also be returned by the user microservice at the same time as we get the user
                const userToRouteTypes = await this.userToRouteTypeService.getUserToRouteTypes(userId) as [UserToRouteType];
                if (userToRouteTypes && userToRouteTypes.length) {
                    // if the user has allowed routes set add them to the query
                    // otherwise the user can use any route type
                    const routeTypes = [] as any;
                    userToRouteTypes.forEach( (userToRouteType) => {
                        routeTypes.push(userToRouteType.route_type_id);
                    });
                    whereConditions.route_type = orm.In(routeTypes);
                } 
                // get the actual best route
                routes = await this.routeService.getRoutes(whereConditions, orderBy, limit) as [Route]; 
            } 
        } catch(err) {
            console.log('Error while getting route', err);
            throw new Error('Error getting route');
        }
        return routes;
    }
}