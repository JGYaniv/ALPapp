import { GraphQLObjectType } from "graphql";

import sample from '../../modules/sample/query';

const query = new GraphQLObjectType({
    name: "query",
    description: "API Queries [Read]",
    fields: () => ({
        //include queries fields here...
        ...sample
    })
})

export default query;