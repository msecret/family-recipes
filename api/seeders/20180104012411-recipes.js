'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Recipes', [
      {
      createdAt: new Date(),
      updatedAt: new Date(),
      title: 'Lasagna',
      instructions: 'Heat the pasta, boil it.\n Create the sauce.\n Put in oven',
      idx: 1,
      story: 'I ate this a lot with my mother'
      },
      {
      createdAt: new Date(),
      updatedAt: new Date(),
      title: 'Ravioli',
      instructions: 'Heat the pasta, boil it.\n Roll the pasta\n Cook sauce',
      idx: 3,
      story: 'This has been in the family for a really long time'
      },
      {
      createdAt: new Date(),
      updatedAt: new Date(),
      title: 'Garlic bread',
      instructions: 'Put garlic pieces on the bread\n Put the bread in oven',
      idx: 2,
      story: 'I always hated this fucking bread'
      }
    ], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Recipes', null, {});
  }
};
