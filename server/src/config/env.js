const env = require('dotenv');

// Load env
env.config(); 

// Environment
const NODE_ENV = process.env.NODE_ENV;

// Port
const PORT =  process.env.PORT || 4000;

module.exports = {NODE_ENV, PORT}