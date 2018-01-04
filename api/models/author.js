'use strict';
module.exports = (sequelize, DataTypes) => {
  const Author = sequelize.define('Author', {
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    email: {
      type: DataTypes.STRING,
      validate: {
        isEmail: true
      }
    },
    image: {
      type: DataTypes.STRING,
      validate: {
        isUrl: true,
      }
    }
  }, {
  });

  Author.associate = function(models) {
    Author.belongsToMany(models.Recipe, {through: 'RecipeAuthor', as: 'recipes' });
  }

  return Author;
};
