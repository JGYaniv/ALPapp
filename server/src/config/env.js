const env = require('dotenv');

// Load env
env.config(); 

// Environment
const NODE_ENV = process.env.NODE_ENV;

// Port
const PORT =  process.env.PORT || 4000;

const DB_DEV_PASSWORD = process.env.DB_DEV_PASSWORD;

module.exports = {NODE_ENV, PORT, DB_DEV_PASSWORD}