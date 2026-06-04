const parentService = require("../services/parent.service");

const create = async (req, res) => {
  try {
    const parent = await parentService.create(req.body);
    res.status(201).json(parent);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getAll = async (req, res) => {
  try {
    const data = await parentService.getAll();
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const getById = async (req, res) => {
  try {
    const data = await parentService.getById(req.params.id);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const update = async (req, res) => {
  try {
    const data = await parentService.update(req.params.id, req.body);
    res.json(data);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const remove = async (req, res) => {
  try {
    await parentService.remove(req.params.id);
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