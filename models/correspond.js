/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('correspond', {
    idPLACE: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'place',
        key: 'idPLACE'
      }
    },
    idSPORT: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'sport',
        key: 'idSPORT'
      }
    }
  }, {
    tableName: 'correspond'
  });
};
