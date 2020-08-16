import { GraphQLObjectType, GraphQLString } from "graphql";

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

export default SampleType;