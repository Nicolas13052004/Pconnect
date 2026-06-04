const messageService = require('../services/message.service');

const envoyer = async (req, res) => {
  try {

    const message =
      await messageService.envoyer(req.body);

    res.status(201).json(message);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const messagesUtilisateur = async (req, res) => {
  try {

    const messages =
      await messageService.messagesUtilisateur(
        req.params.id
      );

    res.json(messages);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

module.exports = {
  envoyer,
  messagesUtilisateur
};