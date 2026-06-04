const eleveService = require('../services/eleve.service');

const getAll = async (req, res) => {
  try {

    const eleves =
      await eleveService.getAll();

    res.json(eleves);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const getById = async (req, res) => {
  try {

    const eleve =
      await eleveService.getById(req.params.id);

    res.json(eleve);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const create = async (req, res) => {
  try {

    const eleve =
      await eleveService.create(req.body);

    res.status(201).json(eleve);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const update = async (req, res) => {
  try {

    const eleve =
      await eleveService.update(
        req.params.id,
        req.body
      );

    res.json(eleve);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const remove = async (req, res) => {
  try {

    await eleveService.remove(req.params.id);

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