'use strict';

module.exports = (sequelize, DataTypes) => {
  const Matiere = sequelize.define('Matiere', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    nom: DataTypes.STRING
  });

  Matiere.associate = (models) => {

    Matiere.hasMany(models.Note, {
      foreignKey: 'matiereId',
      as: 'notes'
    });

  };

  return Matiere;
};