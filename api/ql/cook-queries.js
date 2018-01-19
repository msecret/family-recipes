
const {
  GraphQLNonNull,
  GraphQLString,
  GraphQLInt,
  GraphQLList
} = require('graphql');
const { Op: {iLike} } = require('sequelize');
const { resolver } = require('graphql-sequelize');
const cookType = require('./cook-type');

module.exports = ({ Author }) => ({
  cook: {
    type: cookType,
    args: {
      id: {
        description: 'ID of cook',
        type: new GraphQLNonNull(GraphQLInt)
      }
    },
    resolve: resolver(Author, {
      after: result => (result.length ? result[0] : result)
    })
  },
  cooks: {
    type: new GraphQLList(cookType),
    resolve: resolver(Author)
  },
  cookSearch: {
    type: new GraphQLList(cookType),
    args: {
      query: {
        description: 'Fuzzy-matched name of cook',
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
