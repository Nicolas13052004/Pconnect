const { Note, Eleve, Matiere } = require('../models');

const getAll = async () => {

  return await Note.findAll({
    include: [Eleve, Matiere]
  });

};

const getByEleve = async (eleveId) => {

  return await Note.findAll({
    where: { eleveId },
    include: [Matiere]
  });

};

const create = async (data) => {
  return await Note.create(data);
};

const update = async (id, data) => {

  const note = await Note.findByPk(id);

  if (!note) {
    throw new Error("Note introuvable");
  }

  await note.update(data);

  return note;
};

const remove = async (id) => {

  const note = await Note.findByPk(id);

  if (!note) {
    throw new Error("Note introuvable");
  }

  await note.destroy();

  return true;
};

module.exports = {
  getAll,
  getByEleve,
  create,
  update,
  remove
};