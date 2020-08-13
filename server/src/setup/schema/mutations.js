const { GraphQLObjectType } = require("graphql");


const mutation = new GraphQLObjectType({
    type: "mutation",
    description: "API mutations [Create, Update, Delete]",
    fields: ()=> ({
        //include mutation fields here...
    })
})

module.exports = mutation;