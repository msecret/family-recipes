
const {
  GraphQLNonNull,
  GraphQLString,
  GraphQLInt,
  GraphQLList
} = require('graphql');
const { Op: {iLike} } = require('sequelize');
const { resolver } = require('graphql-sequelize');
const authorType = require('./author-type');

module.exports = ({ Author }) => ({
  author: {
    type: authorType,
    args: {
      id: {
        description: 'ID of author',
        type: new GraphQLNonNull(GraphQLInt)
      }
    },
    resolve: resolver(Author, {
      after: result => (result.length ? result[0] : result)
    })
  },
  authors: {
    type: new GraphQLList(authorType),
    resolve: resolver(Author)
  },
  authorSearch: {
    type: new GraphQLList(authorType),
    args: {
      query: {
        description: 'Fuzzy-matched name of author',
        type: new GraphQLNonNull(GraphQLString)
      }
    },
    resolve: resolver(Author, {
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
