import SampleType from "./type";
import { GraphQLString } from "graphql";
import { samplePrint } from "./resolvers";


export const sampleMutation = {
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

