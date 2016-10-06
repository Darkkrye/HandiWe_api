/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('hour', {
    idHOUR: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    beginningHour: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    endHour: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    }
  }, {
    tableName: 'hour'
  });
};
