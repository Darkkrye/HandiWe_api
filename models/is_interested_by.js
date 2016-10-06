/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('is_interested_by', {
    idUSER: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'user',
        key: 'idUSER'
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
    tableName: 'is_interested_by'
  });
};
