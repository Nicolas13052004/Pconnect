const { Matiere } = require("../models");

const create = async (data) => {
  return await Matiere.create(data);
};

const getAll = async () => {
  return await Matiere.findAll();
};

const getById = async (id) => {
  return await Matiere.findByPk(id);
};

const update = async (id, data) => {
  const matiere = await Matiere.findByPk(id);
  if (!matiere) throw new Error("Matière introuvable");

  return await matiere.update(data);
};

const remove = async (id) => {
  const matiere = await Matiere.findByPk(id);
  if (!matiere) throw new Error("Matière introuvable");

  return await matiere.destroy();
};

module.exports = {
  create,
  getAll,
  getById,
  update,
  remove
};