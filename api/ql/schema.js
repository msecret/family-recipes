
const {
  GraphQLObjectType,
  GraphQLSchema,
} = require('graphql');

const { queries } = require('./fields');

module.exports = new GraphQLSchema({
  query: new GraphQLObjectType({
    name: 'RootQuery',
    fields: () => queries
  })
});
