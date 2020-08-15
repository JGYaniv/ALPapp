'use strict';
module.exports = (sequelize, DataTypes) => {
  const Library = sequelize.define('Library', {
    name: DataTypes.STRING,
    address: DataTypes.STRING
  }, {});
  Library.associate = function(models) {
    // associations can be defined here
  };
  return Library;
};