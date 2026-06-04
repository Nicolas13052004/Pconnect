const { Utilisateur } = require('../models');
const { comparePassword } = require('../utils/hash');
const { generateToken } = require('../utils/jwt');

const login = async (email, password) => {
  const utilisateur = await Utilisateur.findOne({
    where: { email },
  });

  if (!utilisateur) {
    throw new Error('Utilisateur introuvable');
  }

  if (password !== utilisateur.password) {
    throw new Error('Mot de passe incorrect');
  }

  const token = generateToken(utilisateur);

  return {
    token,
    utilisateur: {
      id: utilisateur.id,
      nom: utilisateur.nom,
      prenom: utilisateur.prenom,
      email: utilisateur.email,
      role: utilisateur.role,
    },
  };
};

module.exports = {
  login,
};