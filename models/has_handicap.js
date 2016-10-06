/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('has_handicap', {
    idUSER: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'user',
        key: 'idUSER'
      }
    },
    idHANDICAP: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'handicap',
        key: 'idHANDICAP'
      }
    }
  }, {
    tableName: 'has_handicap'
  });
};
