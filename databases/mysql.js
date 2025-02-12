import { Sequelize } from 'sequelize';


export function conn(){
    return new Sequelize('test', 'root', 'root', {
        host: 'localhost',
        dialect: 'mysql',
        port: 3306,
        logging: false // Desactiva los logs SQL
    });
}

