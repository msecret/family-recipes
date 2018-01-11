'use strict';

const { Author, Recipe } = require('../models');

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('RecipeAuthor', [
    {
      createdAt: new Date(),
      updatedAt: new Date(),
      recipeId: 1,
      authorId: 0
    }, {
      createdAt: new Date(),
      updatedAt: new Date(),
      recipeId: 0,
      authorId: 1
    }, {
      createdAt: new Date(),
      updatedAt: new Date(),
      recipeId: 0,
      authorId: 2
    }, {
      createdAt: new Date(),
      updatedAt: new Date(),
      recipeId: 3,
      authorId: 3
    }]);
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('RecipeAuthor', null, {});
  }
};
