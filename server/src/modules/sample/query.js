import { GraphQLString } from "graphql";

import SampleType from "./type";
import { samplePrint } from "./resolvers";

export const sampleQuery = {
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

