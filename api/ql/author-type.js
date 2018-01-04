
const {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLBoolean,
  GraphQLInt,
  GraphQLString
} = require('graphql');

module.exports = new GraphQLObjectType({
  name: 'Author',
  description: 'An author of a family recipe or the book',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLInt),
        description: 'The id of the author',
      },
      firstName: {
        type: GraphQLString,
      },
      lastName: {
        type: GraphQLString,
      },
      email: {
        type: GraphQLString,
        description: 'The email of the author'
      }
    }
  }
});
