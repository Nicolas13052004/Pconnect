const matiereService = require("../services/matiere.service");

const create = async (req, res) => {
  try {
    const matiere = await matiereService.create(req.body);
    res.status(201).json(matiere);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getAll = async (req, res) => {
  try {
    const data = await matiereService.getAll();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getById = async (req, res) => {
  try {
    const data = await matiereService.getById(req.params.id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const update = async (req, res) => {
  try {
    const data = await matiereService.update(req.params.id, req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const remove = async (req, res) => {
  try {
    await matiereService.remove(req.params.id);
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