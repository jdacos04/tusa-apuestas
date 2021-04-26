
const {Router} = require('express');
const pool = require('../database');
const router = Router();
const {renderEuro}=require('../controllers/europa')

router.get('/euro/euro',renderEuro);













module.exports = router;