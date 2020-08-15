const server = require("./graphql");
const {NODE_ENV, PORT} = require('../config/env');

module.exports = (params) => {
    const options = {port: PORT};
    server.start(options, ()=>console.info(`INFO - Server started on http://localhost:${ PORT } [${ NODE_ENV }]`));  
}