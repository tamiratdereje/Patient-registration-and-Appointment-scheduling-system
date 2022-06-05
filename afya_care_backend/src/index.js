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
const schedule_route = require('./routes/schedule.route');
const user_route = require('./routes/user.route');

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
app.get('/api',(req,res)=>{
    res.json({ message: 'server starts successfully '})
})


// Defining route
app.use('/api/auth', authRoutes);
app.use('/api/medicine', medicine_route);
app.use('/api/record', record_route);
app.use('/api/schedule', schedule_route );
app.use('/api/profile' , user_route);
// assigning port
app.listen(3000,()=>{
    console.log('app running on port: 3000');
});

// Use ( npm start ) to run your server