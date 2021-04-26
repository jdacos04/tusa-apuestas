const passport = require("passport");
userCtrl={};
const pool= require('../database');

userCtrl.renderRegister = (req,res)=>{
    res.render('user/register')
}


userCtrl.register=async(req,res)=>{
    let saldo = 1000
    let errors =[]
    console.log(req.body)

    const{name,email, password,confirm_password} = req.body
    if(password != confirm_password){
        console.log('100')
        errors.push({text:'las contrasenas no son iguales'});
        
    }
    if(password.lenght <4){
        errors.push({text:'las contasena debe tener mas de 4 caracteres '})
        console.log('200')
    }
    if(errors.length>0){
        res.render('user/register',{
            errors,name,email
        })
        console.log('300')
    }
    
    const rows= await pool.query('SELECT * FROM  usuario WHERE usuario_email = $1',[email]  )
    
    if(rows.lenght < 0){
       
        console.log('400')


        res.redirect('/user/register');
    }
    else{
        console.log('500')
        const newuser =await pool.query('INSERT INTO usuario (usuario_nombre, usuario_contrasena, usuario_email,usuario_saldo ) values ($1,$2,$3,$4) ',[name,password,email,saldo])
        console.log(newuser)
    }

  
    console.log(req.body);
   
    res.redirect('/')
}



userCtrl.renderLogin=(req,res)=>{

    res.render('user/login');
}


userCtrl.login= (req, res, next) => {
    // req.check('email', 'Email is Required').notEmpty();
    // req.check('password', 'Password is Required').notEmpty();
    // const errors = req.validationErrors();
    // if (errors.length > 0) {
    //   req.flash('message', errors[0].msg);
    //   res.redirect('/login');
    // }
    passport.authenticate('local.signin', {
      successRedirect: '/user/profile',
      failureRedirect: '/user/login',
    })(req, res, next);
  }









userCtrl.renderHome=(req,res)=>{
    res.render('user/home')
}




userCtrl.renderPerfil=(req,res)=>{
    res.render('user/perfil')
}





module.exports = userCtrl;