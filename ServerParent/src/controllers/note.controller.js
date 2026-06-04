const noteService = require('../services/note.service');

const getAll = async (req, res) => {
  try {

    const notes =
      await noteService.getAll();

    res.json(notes);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const getByEleve = async (req, res) => {
  try {

    const notes =
      await noteService.getByEleve(
        req.params.eleveId
      );

    res.json(notes);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const create = async (req, res) => {
  try {

    const note =
      await noteService.create(req.body);

    res.status(201).json(note);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const update = async (req, res) => {
  try {

    const note =
      await noteService.update(
        req.params.id,
        req.body
      );

    res.json(note);

  } catch (error) {

    res.status(500).json({
      message: error.message
    });

  }
};

const remove = async (req, res) => {
  try {

    await noteService.remove(req.params.id);

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