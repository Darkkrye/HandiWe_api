/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('accept', {
    idHANDICAP: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'handicap',
        key: 'idHANDICAP'
      }
    },
    idPLACE: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'place',
        key: 'idPLACE'
      }
    }
  }, {
    tableName: 'accept'
  });
};
