const { GraphQLObjectType } = require("graphql");


const query = new GraphQLObjectType({
    type: "query",
    description: "API Queries [Read]",
    fields: () => ({
        //include queries fields here...
    })
})

module.exports = query;