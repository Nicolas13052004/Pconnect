'use strict';

module.exports = (sequelize, DataTypes) => {
  const Classe = sequelize.define('Classe', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    nom: DataTypes.STRING,
    niveau: DataTypes.STRING
  });

  Classe.associate = (models) => {

    Classe.hasMany(models.Eleve, {
      foreignKey: 'classId',
      as: 'eleves'
    });

  };

  return Classe;
};