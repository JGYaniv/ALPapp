const { GraphQLObjectType, GraphQLString } = require("graphql");

const SampleType = new GraphQLObjectType({
    name: 'sample',
    description: 'sample type',
    fields: () => ({
        name: {
            type: GraphQLString,
            defaultValue: 'World!'
        }
    })
})

module.exports = SampleType;