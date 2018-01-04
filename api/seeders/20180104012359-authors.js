'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Authors', [
      {
      createdAt: new Date(),
      updatedAt: new Date(),
      firstName: 'Tony',
      lastName: 'Maniac',
      email: 'tony@maniac.com'
      },
      {
      createdAt: new Date(),
      updatedAt: new Date(),
      firstName: 'Joey',
      lastName: 'Fatone',
      email: 'joey@fotone.com'
      }
    ], {});
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Authors', null, {});
  }
};
