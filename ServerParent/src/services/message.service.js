const { Message } = require('../models');

const envoyer = async (data) => {
  return await Message.create(data);
};

const messagesUtilisateur = async (utilisateurId) => {

  return await Message.findAll({
    where: {
      receiverId: utilisateurId
    },
    order: [['createdAt', 'DESC']]
  });

};

module.exports = {
  envoyer,
  messagesUtilisateur
};