'use strict';

module.exports = (sequelize, DataTypes) => {
  const Message = sequelize.define('Message', {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },

    senderId: DataTypes.INTEGER,
    receiverId: DataTypes.INTEGER,

    content: DataTypes.TEXT
  });

  Message.associate = (models) => {

    Message.belongsTo(models.Utilisateur, {
      foreignKey: 'senderId',
      as: 'sender'
    });

    Message.belongsTo(models.Utilisateur, {
      foreignKey: 'receiverId',
      as: 'receiver'
    });

  };

  return Message;
};