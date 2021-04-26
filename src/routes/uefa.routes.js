
const {Router} = require('express');
const pool = require('../database');
const router = Router();
const{renderUefa} = require('../controllers/uefa')



router.get('/uefa/uefa',renderUefa)



module.exports = router;