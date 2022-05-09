// Importing modules
const express = require('express');
const morgan = require('morgan'); // you may need it for logging not compulsory
var config = require('./config/my_config');
var bodyParser = require('body-parser');
var session = require('express-session');
const mongoose = require('mongoose');
const pkg = require('./package.json');
const authRoutes = require('./routes/authentication.route');
const check = require('./routes/check');



// Initializing the app
const app = express();


mongoose.connect(config.database);
var db = mongoose.connection;
db.on('error', console.error.bind(console, "connection error"));
db.once(
    'open', function() {
        console.log("connected.....")
   }
);

app.use('/uploads',express.static('uploads'));

app.get('/welcome', (req, res) => {
    res.json({
        author: app.get('pkg').author,
        name: app.get('pkg').name,
        description: app.get('pkg').description,
        version:app.get('pkg').version
    })
})

// app.get('*', function (req, res, next) {
//     res.locals.api_key = req.session.api_key;
//     console.log(res.locals.api_key);
//     next();
// });

app.use(session({
    secret: 'keyboard cat',
    resave: false,
    saveUninitialized: true,
    // cookie: { secure: true }
  }));


// Initializing middlewares
app.use(morgan('dev'));
app.use(express.json());
// app.use(express.urlencoded({extended: false}));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


// Checking if server starts successfully
app.get('/',(req,res)=>{
    res.json({ message: 'server starts successfully '})
})

app.use('/api/auth', authRoutes);
app.use('/let', check);


// assigning port
app.listen(3000,()=>{
    console.log('app running on port: 3000');
});

// Use ( npm start ) to run your server