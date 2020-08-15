const {DB_DEV_PASSWORD} = require('./env'); 

module.exports = {
  "development": {
    "username": "postgres",
    "password": DB_DEV_PASSWORD,
    "database": "apl",
    "host": "127.0.0.1",
    "dialect": "postgresql"
  },
  "test": {
    "username": "root",
    "password": null,
    "database": "apl",
    "host": "127.0.0.1",
    "dialect": "postgresql"
  },
  "production": {
    "username": "root",
    "password": null,
    "database": "apl",
    "host": "127.0.0.1",
    "dialect": "postgresql"
  }
}
