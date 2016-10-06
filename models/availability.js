/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('availability', {
    idAVAILABILITY: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    jour: {
      type: DataTypes.ENUM('Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi','Dimanche'),
      allowNull: true
    }
  }, {
    tableName: 'availability'
  });
};
