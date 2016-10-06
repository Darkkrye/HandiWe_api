/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('cars', {
    idCARS: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    marque: {
      type: DataTypes.STRING,
      allowNull: false
    },
    modele: {
      type: DataTypes.STRING,
      allowNull: false
    },
    annee: {
      type: DataTypes.INTEGER(4),
      allowNull: false
    },
    wheelchairSeat: {
      type: DataTypes.INTEGER(1),
      allowNull: false
    },
    seat: {
      type: DataTypes.INTEGER(1),
      allowNull: false
    },
    ramp: {
      type: DataTypes.STRING,
      allowNull: false
    },
    image: {
      type: DataTypes.STRING,
      allowNull: false
    },
    city: {
      type: DataTypes.STRING,
      allowNull: false
    },
    county: {
      type: DataTypes.STRING,
      allowNull: false
    },
    ownerName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    priceDay: {
      type: DataTypes.INTEGER(11),
      allowNull: false
    },
    isReserved: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: '0'
    }
  }, {
    tableName: 'cars'
  });
};
