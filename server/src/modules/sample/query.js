const { GraphQLObjectType, GraphQLString } = require("graphql");

const SampleType = require("./type");
const { samplePrint } = require("./resolvers");

const sampleQuery = {
    type: SampleType,
    args: {
        name: {
            name: 'name',
            type: GraphQLString,
            defaultValue: 'World'
        }
    },
    resolve: samplePrint
};

module.exports = { sampleQuery };