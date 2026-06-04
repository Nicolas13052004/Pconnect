'use strict';

module.exports = (sequelize, DataTypes) => {
  const Annonce = sequelize.define('Annonce', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    titre: DataTypes.STRING,
    contenu: DataTypes.TEXT
  });

  return Annonce;
};