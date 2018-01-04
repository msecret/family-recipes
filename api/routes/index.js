
const bodyParser = require('body-parser');
const { graphqlExpress, graphiqlExpress } = require('apollo-server-express');
const { NODE_ENV } = process.env;

module.exports = function (app) {
  const schema = require('../schema');
  app.use('/graphql', bodyParser.json(), (req, res, next) =>
    graphqlExpress({
      schema,
      context: { user: req.user }
    })(req, res, next)
  );
  if (NODE_ENV === 'development') {
    app.get('/graphiql', graphiqlExpress({
      endpointURL: '/graphql'
    }));
  }
}
