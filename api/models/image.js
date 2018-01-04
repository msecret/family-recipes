'use strict';
module.exports = (sequelize, DataTypes) => {
  const Image = sequelize.define('Image', {
    name: DataTypes.STRING,
    url: DataTypes.STRING,
    alt: DataTypes.STRING,
    data: DataTypes.BLOB
  }, {
  });

  Image.associate = function(models) {

  }
  return Image;
};
