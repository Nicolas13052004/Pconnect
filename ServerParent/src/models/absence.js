'use strict';

module.exports = (sequelize, DataTypes) => {
  const Absence = sequelize.define('Absence', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    eleveId: DataTypes.INTEGER,
    date: DataTypes.DATE,
    motif: DataTypes.STRING
  });

  Absence.associate = (models) => {

    Absence.belongsTo(models.Eleve, {
      foreignKey: 'eleveId',
      as: 'eleve'
    });

  };

  return Absence;
};