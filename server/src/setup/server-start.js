import server from "./graphql";
import {NODE_ENV, PORT} from '../config/env';

const startServer = (params) => {
    const options = {port: PORT};
    server.start(options, ()=>console.info(`INFO - Server started on http://localhost:${ PORT } [${ NODE_ENV }]`));  
}

export default startServer;