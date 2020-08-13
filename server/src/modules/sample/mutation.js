const SampleType = require("./type");
const { GraphQLString } = require("graphql");
const { samplePrint } = require("./resolvers");


const sampleMutation = {
    type: SampleType,
    args: {
        name: {
            name: 'name',
            type: GraphQLString,
            defaultValue: 'World'
        }
    },
    resolve: samplePrint
}

module.exports = { sampleMutation };