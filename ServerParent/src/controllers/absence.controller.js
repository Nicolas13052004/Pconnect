const absenceService = require('../services/absence.service');

const getAll = async (req, res) => {
  try {

    const absences =
      await absenceService.getAll();

    res.json(absences);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const getByEleve = async (req, res) => {
  try {

    const absences =
      await absenceService.getByEleve(
        req.params.eleveId
      );

    res.json(absences);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const create = async (req, res) => {
  try {

    const absence =
      await absenceService.create(req.body);

    res.status(201).json(absence);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const update = async (req, res) => {
  try {

    const absence =
      await absenceService.update(
        req.params.id,
        req.body
      );

    res.json(absence);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const remove = async (req, res) => {
  try {

    await absenceService.remove(req.params.id);

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
  getByEleve,
  create,
  update,
  remove
};