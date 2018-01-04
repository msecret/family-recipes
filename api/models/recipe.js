
'use strict';

module.exports = (sequelize, DataTypes) => {
  const Recipe = sequelize.define('Recipe', {
    title: DataTypes.STRING,
    created: DataTypes.DATE,
    instructions: DataTypes.TEXT,
    idx: DataTypes.INTEGER,
    story: DataTypes.TEXT,
    image: DataTypes.STRING
  }, {
  });

  Recipe.associate = function(models) {
    Recipe.hasOne(models.Image { as: 'mainImage' });
    Recipe.belongsToMany(models.Author, {through: 'RecipeAuthor', as: 'authors' });
  }

  return Recipe;
};
