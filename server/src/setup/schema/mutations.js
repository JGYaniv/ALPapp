const { GraphQLObjectType } = require("graphql");

import sample from '../../modules/sample/mutation';

const mutation = new GraphQLObjectType({
    name: "mutation",
    description: "API mutations [Create, Update, Delete]",
    fields: ()=> ({
        //include mutation fields here...
        ...sample
    })
})

export default mutation;