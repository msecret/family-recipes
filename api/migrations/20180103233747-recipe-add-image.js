'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn(
      'Recipes', // name of Target model
      'mainImageId', // name of the key we're adding
      {
        type: Sequelize.INTEGER,
        references: {
          model: 'Images', // name of Source model
          key: 'id',
        },
        onUpdate: 'CASCADE',
        onDelete: 'SET NULL',
      }
    )
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.removeColumn(
      'Recipes', // name of the Target model
      'mainImageId' // key we want to remove
    );
  }
};
