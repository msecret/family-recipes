const db = require('../models');

module.exports = [
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
