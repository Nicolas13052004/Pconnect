

const { Eleve, Classe, Utilisateur, Note, Absence } = require("../models");

const getAll = async () => {
  return await Eleve.findAll({
    include: [
      {
        model: Classe,
        as: "classe"
      },
      {
        model: Utilisateur,
        as: "parent"
      },
      {
        model: Note,
        as: "notes"
      },
      {
        model: Absence,
        as: "absences"
      }
    ]
  });
};

const getById = async (id) => {

  return await Eleve.findByPk(id, {
    include: [Classe]
  });

};

const create = async (data) => {
  return await Eleve.create(data);
};

const update = async (id, data) => {

  const eleve = await Eleve.findByPk(id);

  if (!eleve) {
    throw new Error("Élève introuvable");
  }

  await eleve.update(data);

  return eleve;
};

const remove = async (id) => {

  const eleve = await Eleve.findByPk(id);

  if (!eleve) {
    throw new Error("Élève introuvable");
  }

  await eleve.destroy();

  return true;
};

module.exports = {
  getAll,
  getById,
  create,
  update,
  remove
};