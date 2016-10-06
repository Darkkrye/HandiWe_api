/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('place', {
    idPLACE: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false
    },
    type: {
      type: DataTypes.STRING,
      allowNull: false
    },
    address: {
      type: DataTypes.STRING,
      allowNull: false
    },
    addressComplement1: {
      type: DataTypes.STRING,
      allowNull: true
    },
    addressComplement2: {
      type: DataTypes.STRING,
      allowNull: true
    },
    zipCode: {
      type: DataTypes.CHAR(5),
      allowNull: true
    },
    city: {
      type: DataTypes.STRING,
      allowNull: true
    },
    mail: {
      type: DataTypes.STRING,
      allowNull: true
    },
    telephone: {
      type: DataTypes.CHAR(14),
      allowNull: true
    },
    accountantName: {
      type: DataTypes.STRING,
      allowNull: true
    },
    hasMaterial: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    },
    hasFreeAccess: {
      type: DataTypes.BOOLEAN,
      allowNull: true
    }
  }, {
    tableName: 'place'
  });
};
