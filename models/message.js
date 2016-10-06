/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('message', {
    idMESSAGE: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    message: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    sendDate: {
      type: DataTypes.DATE,
      allowNull: false
    },
    idCONVERSATIONUSERA: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    idCONVERSATIONUSERB: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    FromCreator: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    }
  }, {
    tableName: 'message'
  });
};
