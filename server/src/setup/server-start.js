const server = require("./graphql");

export default function (params) {
    const options = {port: 4000};

    server.start(options, ()=>console.log('Server is running on localhost:' + options.port));  
}