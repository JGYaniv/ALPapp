import { Sequelize} from 'sequelize';

import databaseConfig from '../config/config.json';

const databaseConfigEnv = databaseConfig[process.env.NODE_ENV];

// Create new database connection
const connection  = new Sequelize(databaseConfigEnv.database, databaseConfigEnv.username, databaseConfigEnv.password, {
    host: databaseConfigEnv.host,
    dialect: databaseConfigEnv.dialect
});

// Auth database connection
connection.
authenticate()
.then(() => {
console.info('INFO - Database connected.')
})
.catch(err => {
console.error('ERROR - Unable to connect to the database:', err)
});


export default connection;

