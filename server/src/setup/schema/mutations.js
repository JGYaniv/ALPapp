const { GraphQLObjectType } = require("graphql");

const sample = require('../../modules/sample/mutation');

const mutation = new GraphQLObjectType({
    name: "mutation",
    description: "API mutations [Create, Update, Delete]",
    fields: ()=> ({
        //include mutation fields here...
        ...sample
    })
})

module.exports = mutation;