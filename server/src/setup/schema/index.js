import { GraphQLSchema }  from "graphql";

import mutation from "./mutations";
import query from "./queries";

const schema = new GraphQLSchema({
    query,
    mutation 
});

export default schema;