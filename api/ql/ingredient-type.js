
const {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLBoolean,
  GraphQLInt,
  GraphQLString
} = require('graphql');

module.exports = new GraphQLObjectType({
  name: 'Ingredient',
  description: 'An ingredient as part of a recipe',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLInt),
        description: 'The id of the ingredient',
      },
      name: {
        type: GraphQLString,
        description: 'The name of the ingredient'
      },
      amount: {
        type: GraphQLInt,
        description: 'The total amount of the ingredient'
      },
      unit: {
        type: GraphQLString,
        description: 'The unit of measure for the amount for the ingredient'
      }
    }
  }
});
