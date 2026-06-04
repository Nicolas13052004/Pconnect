'use strict';

module.exports = (sequelize, DataTypes) => {
  const ParentEleve = sequelize.define('ParentEleve', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    parentId: DataTypes.INTEGER,
    eleveId: DataTypes.INTEGER
  });

  ParentEleve.associate = (models) => {

    ParentEleve.belongsTo(models.Utilisateur, {
      foreignKey: 'parentId',
      as: 'parent'
    });

    ParentEleve.belongsTo(models.Eleve, {
      foreignKey: 'eleveId',
      as: 'eleve'
    });

  };

  return ParentEleve;
};