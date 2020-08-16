'use strict';
module.exports = (sequelize, DataTypes) => {
  const Copy = sequelize.define('Copy', {
    library_id: DataTypes.INTEGER,
    book_id: DataTypes.INTEGER,
    book_number: DataTypes.INTEGER
  }, {});
  Copy.associate = function(models) {
    // associations can be defined here
  };
  return Copy;
};