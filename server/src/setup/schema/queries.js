const { GraphQLObjectType } = require("graphql");

const sample = require('../../modules/sample/query');

const query = new GraphQLObjectType({
    name: "query",
    description: "API Queries [Read]",
    fields: () => ({
        //include queries fields here...
        ...sample
    })
})

module.exports = query;