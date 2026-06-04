const { Utilisateur } = require('../models');

const getAll = async () => {
  return await Utilisateur.findAll();
};

const getById = async (id) => {
  return await Utilisateur.findByPk(id);
};

const create = async (data) => {
  return await Utilisateur.create(data);
};

const update = async (id, data) => {

  const utilisateur = await Utilisateur.findByPk(id);

  if (!utilisateur) {
    throw new Error("Utilisateur introuvable");
  }

  await utilisateur.update(data);

  return utilisateur;
};

const remove = async (id) => {

  const utilisateur = await Utilisateur.findByPk(id);

  if (!utilisateur) {
    throw new Error("Utilisateur introuvable");
  }

  await utilisateur.destroy();

  return true;
};

module.exports = {
  getAll,
  getById,
  create,
  update,
  remove
};