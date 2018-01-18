
const {
  GraphQLObjectType,
  GraphQLNonNull,
  GraphQLBoolean,
  GraphQLInt,
  GraphQLList,
  GraphQLString
} = require('graphql');
const { resolver } = require('graphql-sequelize');

const AuthorType = require('./author-type');
const { Recipe } = require('../models');

module.exports = new GraphQLObjectType({
  name: 'Recipe',
  description: 'A family recipe',
  fields: () => {
    return {
      id: {
        type: new GraphQLNonNull(GraphQLInt),
        description: 'The id of the recipe',
      },
      title: {
        type: new GraphQLNonNull(GraphQLString),
        description: 'The title of the recipe',
      },
      instructions: {
        type: new GraphQLNonNull(GraphQLString),
        description: 'Recipe instructions',
      },
      idx: {
        type: GraphQLInt,
        description: 'The place where the recipe is in the official book'
      },
      story: {
        type: GraphQLInt,
        description: 'A story that goes along with the recipe'
      },
      authors: {
        type: new GraphQLList(AuthorType),
        description: 'The authors of the recipe',
        resolve: resolver(Recipe.associations.authors)
      }
    }
  }
})
