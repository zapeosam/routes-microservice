import { User } from '../entities/User';
import { DataSource, Repository } from 'typeorm';

export class UserService {
    private userRepository: Repository<User>;
    
    constructor(dataSource: DataSource) {
        this.userRepository = dataSource.getRepository(User);
    }

    async getUserById(userId: string): Promise<User> {
        return await this.userRepository.findOneBy({id: userId}) as User;
    }
}