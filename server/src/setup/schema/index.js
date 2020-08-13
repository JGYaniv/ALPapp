const { GraphQLSchema }  =  require("graphql");

const mutation = require("./mutations");
const query = require("./queries");

const schema = new GraphQLSchema({
    query,
    mutation 
});

module.exports = schema;