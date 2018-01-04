const db = require('../models');

module.exports = [
  'author',
  'recipe'
].reduce(
  ({ queries }, model) => ({
    queries: {
      ...require(`./${model}-queries`)(db),
      ...queries
    }
  }),
  { queries: {} }
);
