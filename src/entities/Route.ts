import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

// mapping for routes database table
@Entity('routes')
export class Route {
    @PrimaryGeneratedColumn("uuid")
    id!: string;

    @Column()
    route_type!: string;

    @Column()
    traffic_level!: number;

    @Column()
    cost!: number;

    @Column()
    route_info!: string;
}