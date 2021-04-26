const express = require('express');
const path = require('path');
const morgan =require('morgan');
const session = require('express-session');
const exphbs = require('express-handlebars')
const flash = require('connect-flash');
const pgstore =require('express-pg-session');
const { database } = require('./keys');
const passport = require('passport');
require('./keys')

//incializacion 
const app =  express();
require('./lib/passport');

//configuraciones
app.set('port', process.env.PORT || 4000);
app.set('views',path.join(__dirname , 'views'));

app.engine('.hbs', exphbs({
    defaultLayout: 'main',
 layoutsDir: path.join(app.get('views'), 'layouts'),
 partialsDir:path.join(app.get('views'), 'partials'),
 userdir:path.join(app.get('views'), 'user'),
 apuestasdir:path.join(app.get('views'), 'apuestas'),
 extname:'.hbs',
 helpers: require ('./lib/handlebars')
 
}));
app.set('view engine','.hbs');



//midelwares 
app.use(express.urlencoded({extended: false}));
app.use(morgan('dev'));
app.use(express.json());
app.use(session({
    resave:true,
    saveUninitialized:true,
   secret: 'tajaditas',
    resave: false,
    cookie: { maxAge: 30 * 24 * 60 * 60 * 1000 } // 30 days
  }));
//app.use(flash());
app.use(passport.initialize());
app.use(passport.session());

//variables globales 
app.use((res,req,next)=>{
    //req.locals.success = req.flash('success')
   
   
    next();
});



//rutas
app.use(require('./routes/index.routes'));
app.use(require('./routes/user.routes'));
app.use(require('./routes/apuestas.routes'));
app.use(require('./routes/ligae.routes'));
app.use(require('./routes/europa.routes'));
app.use(require('./routes/uefa.routes'));






//archivos estaticos
app.use(express.static(__dirname + '/public'));
app.use('/css',express.static(__dirname + '/public/css'));
app.use(express.static(path.join(__dirname, 'public')));
app.use("/public", express.static(path.join(__dirname, "../public")));

module.exports = app;