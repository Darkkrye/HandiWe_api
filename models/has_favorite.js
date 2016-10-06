/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('has_favorite', {
    idUSER: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'user',
        key: 'idUSER'
      }
    },
    idFAVORITE: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'user',
        key: 'idUSER'
      }
    }
  }, {
    tableName: 'has_favorite'
  });
};
