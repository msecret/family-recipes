
const {
  GraphQLNonNull,
  GraphQLString,
  GraphQLInt,
  GraphQLList
} = require('graphql');
const { Op: {iLike} } = require('sequelize');
const { resolver } = require('graphql-sequelize');
const recipeType = require('./recipe-type');

module.exports = ({ Recipe }) => ({
  recipe: {
    type: recipeType,
    args: {
      id: {
        description: 'ID of recpe',
        type: new GraphQLNonNull(GraphQLInt)
      }
    },
    resolve: resolver(Recipe, {
      after: result => (result.length ? result[0] : result)
    })
  },
  recipes: {
    type: new GraphQLList(recipeType),
    resolve: resolver(Recipe)
  },
  recipeSearch: {
    type: new GraphQLList(recipeType),
    args: {
      query: {
        description: 'Fuzzy-matched name of recipe',
        type: new GraphQLNonNull(GraphQLString)
      }
    },
    resolve: resolver(Recipe, {
      dataLoader: false,
      before: (findOptions, args) => ({
        where: {
          name: { [iLike]: `%${args.query}%` }
        },
        order: [['name', 'ASC']],
        ...findOptions
      })
    })
  }
});
