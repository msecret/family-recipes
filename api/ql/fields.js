const db = require('../models');

module.exports = [
  'cook',
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
