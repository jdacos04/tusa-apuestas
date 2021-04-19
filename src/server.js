const express = require('express');
const path = require('path');
const morgan =require('morgan');
const session = require('express-session');

const esj = require('ejs')
const hbs =require('handlebars');
const exphbs = require('express-handlebars')


//incializacion 
const app =  express();

//configuraciones
app.set('port', process.env.PORT || 4000);
app.set('views',path.join(__dirname , 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
 layoutsDir: path.join(app.get('views'), 'layouts'),
 partialsDir:path.join(app.get('views'), 'partials'),
 userDir:path.join(app.get('views'),'user'),
 extname:'.hbs',
 
}));
app.set('view engine','.hbs');
//app.set('view engine','.ejs');


//midelwares 
app.use(express.urlencoded({extended: false}));
app.use(morgan('dev'));


app.use(express.json());
app.use(session({
    secret:'secret',
    resave: true,
    saveUninitialized: true
}));

//variables globales 

//rutas
app.use(require('./routes/index.routes'));
app.use(express.static(__dirname + '/public'));
app.use('/css',express.static(__dirname + '/public/css'));



//archivos estaticos
app.use(express.static(path.join(__dirname, 'public')));
app.use("/public", express.static(path.join(__dirname, "../public")));

module.exports = app;