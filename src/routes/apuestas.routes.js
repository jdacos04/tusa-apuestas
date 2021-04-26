const {Router} = require('express');
const router = Router();
const pool= require('../database');
const { inspect } = require('util');




router.get('/apuestas/apuesta',(req,res)=>{
    res.render('apuestas/apuesta')
})



router.post('/apuestas/apuesta', async (req,res)=>{
    console.log(req.body)
    const {titulo, contenido}=req.body;
    
    
       await pool.query('INSERT INTO apuestas (titulo, contenido) values ($1,$2) ',[titulo,contenido])
       req.flash('success','apostastes chamo no te puedes echar para atras')
  
    res.send('llego')
    
})


router.get('/apuestas/list', async(req,res)=>{
    const apuestas = await pool.query('SELECT * FROM apuestas');
    const list = apuestas.rows
    

    
    res.render('apuestas/list',{list});
  })


router.get('/equipos',(req,res)=>{
    res.render('apuestas/equipos')
})




router.get('/jugadores')




module.exports = router;