'use strict';

module.exports = (sequelize, DataTypes) => {
  const Note = sequelize.define('Note', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    eleveId: DataTypes.INTEGER,
    matiereId: DataTypes.INTEGER,
    note: DataTypes.FLOAT,
    coefficient: DataTypes.INTEGER,
    trimestre: DataTypes.STRING
  });

  Note.associate = (models) => {

    Note.belongsTo(models.Eleve, {
      foreignKey: 'eleveId',
      as: 'eleve'
    });

    Note.belongsTo(models.Matiere, {
      foreignKey: 'matiereId',
      as: 'matiere'
    });

  };

  return Note;
};