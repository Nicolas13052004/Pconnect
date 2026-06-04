const { Annonce } = require('../models');

const getAll = async () => {
  return await Annonce.findAll({
    order: [['createdAt', 'DESC']]
  });
};

const create = async (data) => {
  return await Annonce.create(data);
};

const remove = async (id) => {

  const annonce = await Annonce.findByPk(id);

  if (!annonce) {
    throw new Error("Annonce introuvable");
  }

  await annonce.destroy();

  return true;
};

module.exports = {
  getAll,
  create,
  remove
};