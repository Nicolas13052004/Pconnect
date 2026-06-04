const classeService = require("../services/classe.service");

const create = async (req, res) => {
  try {
    const classe = await classeService.create(req.body);
    res.status(201).json(classe);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getAll = async (req, res) => {
  try {
    const data = await classeService.getAll();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getById = async (req, res) => {
  try {
    const data = await classeService.getById(req.params.id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const update = async (req, res) => {
  try {
    const data = await classeService.update(req.params.id, req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const remove = async (req, res) => {
  try {
    await classeService.remove(req.params.id);
    res.json({ success: true });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

module.exports = {
  create,
  getAll,
  getById,
  update,
  remove
};