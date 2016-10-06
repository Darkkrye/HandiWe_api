/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('has_hours', {
    idHOUR: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'hour',
        key: 'idHOUR'
      }
    },
    idAVAILABILITY: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'availability',
        key: 'idAVAILABILITY'
      }
    }
  }, {
    tableName: 'has_hours'
  });
};
