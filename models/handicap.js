/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('handicap', {
    idHANDICAP: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: true
    },
    type: {
      type: DataTypes.STRING,
      allowNull: true
    }
  }, {
    tableName: 'handicap'
  });
};
