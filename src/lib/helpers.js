const bcrypt = require('bcryptjs');

const helpers = {};
//para el registro papa
helpers.encryptPassword = async (password) => {
  const salt = await bcrypt.genSalt(10);
  const hash = await bcrypt.hash(password, salt);
  return hash;
};
//para el login mi reina 
//me encantna los comentarios me puedo desaogar vergacion nojoda quiero dejar de ser un maldito bagreaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
//maldita sea so una jodida desgracia humano no joda
//vergacion
//me alegra que nadie va a ver esto nunca nojoda 
//capas dani si algun dia se digna a pasar web2

helpers.matchPassword = async (password, savedPassword) => {
  try {
    return await bcrypt.compare(password, savedPassword);
  } catch (e) {
    console.log(e)
  }
};

module.exports = helpers;