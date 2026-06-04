const { Absence, Eleve } = require('../models');

const getAll = async () => {

  return await Absence.findAll({
    include: [Eleve]
  });

};

const getByEleve = async (eleveId) => {

  return await Absence.findAll({
    where: { eleveId }
  });

};

const create = async (data) => {
  return await Absence.create(data);
};

const update = async (id, data) => {

  const absence = await Absence.findByPk(id);

  if (!absence) {
    throw new Error("Absence introuvable");
  }

  await absence.update(data);

  return absence;
};

const remove = async (id) => {

  const absence = await Absence.findByPk(id);

  if (!absence) {
    throw new Error("Absence introuvable");
  }

  await absence.destroy();

  return true;
};

module.exports = {
  getAll,
  getByEleve,
  create,
  update,
  remove
};