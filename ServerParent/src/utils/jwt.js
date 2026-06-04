const jwt = require('jsonwebtoken');

const JWT_SECRET = 'parentconnect_secret_key';

/**
 * Générer un token
 */
const generateToken = (user) => {
  return jwt.sign(
    {
      id: user.id,
      email: user.email,
      role: user.role,
    },
    JWT_SECRET,
    {
      expiresIn: '7d',
    }
  );
};

/**
 * Vérifier un token
 */
const verifyToken = (token) => {
  return jwt.verify(token, JWT_SECRET);
};

module.exports = {
  generateToken,
  verifyToken,
};