const {Router} = require('express');
const pool = require('../database');
const router = Router();





router.get('/',(req,res)=>{
    res.render('index')
})


 





module.exports = router;