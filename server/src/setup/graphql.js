const { GraphQLServer } = require("graphql-yoga");

const { schema } = require('./schema')

const server = new GraphQLServer({ schema });

export default server;