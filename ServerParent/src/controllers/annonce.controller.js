const annonceService = require('../services/annonce.service');

const getAll = async (req, res) => {
  try {

    const annonces =
      await annonceService.getAll();

    res.json(annonces);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const create = async (req, res) => {
  try {

    const annonce =
      await annonceService.create(req.body);

    res.status(201).json(annonce);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const remove = async (req, res) => {
  try {

    await annonceService.remove(req.params.id);

    res.json({
      success: true
    });

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

module.exports = {
  getAll,
  create,
  remove
};