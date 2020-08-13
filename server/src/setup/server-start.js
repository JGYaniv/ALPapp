const server = require("./graphql");

module.exports = (params) => {
    const options = {port: 4000};
    server.start(options, ()=>console.log('Server is running on localhost:' + options.port));  
}