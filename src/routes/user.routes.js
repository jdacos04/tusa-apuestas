const {Router} = require('express');
const pool = require('../database');
const router = Router();
const passport = require('passport');
const {renderPerfil,renderHome,renderLogin,renderRegister,register,login}=require('../controllers/users');

router.get('/user/register',renderRegister)

router.post('/user/register',register)


router.get('/user/login', renderLogin);
  
router.post('/user/login',login);



router.get('/user/home',renderHome);




router.get('/user/perfil',renderPerfil);

















module.exports = router;