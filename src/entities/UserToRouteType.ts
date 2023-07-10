import { Entity, PrimaryColumn } from 'typeorm';

// mapping for user_to_route_type database table
@Entity('user_to_route_type')
export class UserToRouteType {
    @PrimaryColumn()
    user_id!: string;

    @PrimaryColumn()
    route_type_id!: string;
}