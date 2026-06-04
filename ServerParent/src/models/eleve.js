'use strict';

module.exports = (sequelize, DataTypes) => {
  const Eleve = sequelize.define('Eleve', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    nom: DataTypes.STRING,
    prenom: DataTypes.STRING,
    dateNaissance: DataTypes.DATE,

    classId: DataTypes.INTEGER,
    parentId: DataTypes.INTEGER
  });

  Eleve.associate = (models) => {

    Eleve.belongsTo(models.Classe, {
      foreignKey: 'classId',
      as: 'classe'
    });

    Eleve.belongsTo(models.Utilisateur, {
      foreignKey: 'parentId',
      as: 'parent'
    });

    Eleve.hasMany(models.Note, {
      foreignKey: 'eleveId',
      as: 'notes'
    });

    Eleve.hasMany(models.Absence, {
      foreignKey: 'eleveId',
      as: 'absences'
    });

  };

  return Eleve;
};