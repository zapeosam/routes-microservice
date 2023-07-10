import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

// mapping for user database table
@Entity('users')
export class User {
    @PrimaryGeneratedColumn("uuid")
    id!: string;

    @Column()
    name!: string;

    @Column()
    cost_limit!: number;
}