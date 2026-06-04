'use strict';

module.exports = (sequelize, DataTypes) => {
  const Utilisateur = sequelize.define('Utilisateur', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    nom: DataTypes.STRING,
    prenom: DataTypes.STRING,
    email: DataTypes.STRING,
    password: DataTypes.STRING,

    role: {
      type: DataTypes.STRING,
      defaultValue: "parent"
    }
  });

  Utilisateur.associate = (models) => {

    Utilisateur.hasMany(models.Eleve, {
      foreignKey: 'parentId',
      as: 'enfants'
    });

    Utilisateur.hasMany(models.Message, {
      foreignKey: 'senderId',
      as: 'messagesEnvoyes'
    });

    Utilisateur.hasMany(models.Message, {
      foreignKey: 'receiverId',
      as: 'messagesRecus'
    });

  };

  return Utilisateur;
};