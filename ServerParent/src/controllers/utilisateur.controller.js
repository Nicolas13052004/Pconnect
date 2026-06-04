const utilisateurService = require('../services/utilisateur.service');

const getAll = async (req, res) => {
  try {

    const utilisateurs =
      await utilisateurService.getAll();

    res.json(utilisateurs);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const getById = async (req, res) => {
  try {

    const utilisateur =
      await utilisateurService.getById(req.params.id);

    res.json(utilisateur);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const create = async (req, res) => {
  try {

    const utilisateur =
      await utilisateurService.create(req.body);

    res.status(201).json(utilisateur);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const update = async (req, res) => {
  try {

    const utilisateur =
      await utilisateurService.update(
        req.params.id,
        req.body
      );

    res.json(utilisateur);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const remove = async (req, res) => {
  try {

    await utilisateurService.remove(req.params.id);

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
  getById,
  create,
  update,
  remove
};