const { Classe } = require("../models");

const create = async (data) => {
  return await Classe.create(data);
};

const getAll = async () => {
  return await Classe.findAll();
};

const getById = async (id) => {
  return await Classe.findByPk(id);
};

const update = async (id, data) => {
  const classe = await Classe.findByPk(id);
  if (!classe) throw new Error("Classe introuvable");

  return await classe.update(data);
};

const remove = async (id) => {
  const classe = await Classe.findByPk(id);
  if (!classe) throw new Error("Classe introuvable");

  return await classe.destroy();
};

module.exports = {
  create,
  getAll,
  getById,
  update,
  remove
};