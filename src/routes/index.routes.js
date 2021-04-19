const {Router} = require('express');
const router = Router();





router.get('/',(req,res)=>{
    res.render('index')
})



router.get('/user/register',(req,res)=>{
    res.render('user/register')
})
router.get('/user/login',(req,res)=>{
    res.render('user/login')
})




module.exports = router;