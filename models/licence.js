/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('licence', {
    idLICENCE: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    licenceNum: {
      type: DataTypes.STRING,
      allowNull: false
    },
    clubName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    idUSER: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      references: {
        model: 'licence',
        key: 'idLICENCE'
      }
    }
  }, {
    tableName: 'licence'
  });
};
