
const {Router} = require('express');
const pool = require('../database');
const router = Router();
const {renderLigae} = require('../controllers/ligae');



router.get('/ligae/e',renderLigae)






module.exports = router;