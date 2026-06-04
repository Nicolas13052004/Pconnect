const { Utilisateur } = require("../models");

const create = async (data) => {
  return await Utilisateur.create({
    ...data,
    role: "parent"
  });
};

const getAll = async () => {
  return await Utilisateur.findAll({
    where: { role: "parent" }
  });
};

const getById = async (id) => {
  return await Utilisateur.findByPk(id);
};

const update = async (id, data) => {
  const parent = await Utilisateur.findByPk(id);
  if (!parent) throw new Error("Parent introuvable");

  return await parent.update(data);
};

const remove = async (id) => {
  const parent = await Utilisateur.findByPk(id);
  if (!parent) throw new Error("Parent introuvable");

  return await parent.destroy();
};

module.exports = {
  create,
  getAll,
  getById,
  update,
  remove
};