// Importing modules
const express = require('express');
const morgan = require('morgan'); // you may need it for logging not compulsory
var bodyParser = require('body-parser');
var session = require('express-session');
const mongoose = require('mongoose');
const authRoutes = require('./routes/authentication.route');
// const check = require('./routes/check');
const medicine_route = require('./routes/medicine.route');
const record_route = require('./routes/record_route');
const schedule_route = require('./routes/schedule.route')

const dotEnv = require('dotenv');

// Initializing the app
const app = express();

// initalizing environment varaible file
dotEnv.config();

//connecting to database
mongoose.connect(process.env.DATA_BASE);
var db = mongoose.connection;
db.on('error', console.error.bind(console, "connection error"));
db.once('open', () => {console.log("connected.....") });


app.use('/uploads',express.static('uploads'));
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
    // cookie: { secure: true }
  }));

// Initializing middlewares
app.use(morgan('dev'));
app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Checking if server starts successfully
app.get('/',(req,res)=>{
    res.json({ message: 'server starts successfully '})
})

// Defining routes
app.use('/api/auth', authRoutes);
app.use('/let', check);
app.use('/medicine', medicine_route);
app.use('/record', record_route);
app.use('/schedule', schedule_route );

// assigning port
app.listen(3000,()=>{
    console.log('app running on port: 3000');
});

// Use ( npm start ) to run your server