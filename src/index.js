// Importing modules
const express = require('express');
const morgan = require('morgan'); // you may need it for logging not compulsory


// Initializing the app
const app = express();



// Initializing middlwares
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({extended: false}));

// Checking if server starts successfully
app.get('/',(req,res)=>{
    res.json({ message: 'server starts successfully '})
})


// assigning port
app.listen(3000,()=>{
    console.log('app running on port: 3000');
});

// Use ( npm start ) to run your server