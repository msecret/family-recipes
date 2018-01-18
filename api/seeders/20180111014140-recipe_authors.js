'use strict';

const { Author, Recipe } = require('../models');

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('RecipeAuthor', [
    {
      createdAt: new Date(),
      updatedAt: new Date(),
      RecipeId: 1,
      AuthorId: 2
    }, {
      createdAt: new Date(),
      updatedAt: new Date(),
      RecipeId: 2,
      AuthorId: 1
    }, {
      createdAt: new Date(),
      updatedAt: new Date(),
      RecipeId: 0,
      AuthorId: 2
    }, {
      createdAt: new Date(),
      updatedAt: new Date(),
      RecipeId: 3,
      AuthorId: 3
    }]);
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('RecipeAuthor', null, {});
  }
};
