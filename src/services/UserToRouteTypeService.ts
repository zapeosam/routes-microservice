import { UserToRouteType } from '../entities/UserToRouteType';
import { DataSource, Repository } from 'typeorm';

export class UserToRouteTypeService {
    private userToRouteTypeRepository: Repository<UserToRouteType>;
    
    constructor(dataSource: DataSource) {
        this.userToRouteTypeRepository = dataSource.getRepository(UserToRouteType);
    }

    async getUserToRouteTypes(userId: string): Promise<[UserToRouteType]> {
        return await this.userToRouteTypeRepository.findBy({ user_id: userId })as [UserToRouteType];
    }
}