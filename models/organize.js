/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('organize', {
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
    },
    idAVAILABILITY: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'availability',
        key: 'idAVAILABILITY'
      }
    },
    zipCode: {
      type: DataTypes.CHAR(5),
      allowNull: false
    }
  }, {
    tableName: 'organize'
  });
};
