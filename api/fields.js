const db = require('./models');

module.exports = [
  'recipe'
].reduce(
  ({ queries }, model) => ({
    //Splat all queries and mutations on the top level
    queries: {
      ...require(`./${model}-queries`)(db),
      ...queries
    }
  }),
  { queries: {} }
);
