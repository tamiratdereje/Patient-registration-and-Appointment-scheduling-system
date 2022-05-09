const User = require('../models/user.js');
const jwt = require('jsonwebtoken');
const config = require('../config/my_config');

const signUp = async (req, res) => {
    
    email = req.body.email;
    password = req.body.password;
    roles = req.body.roles;

    if(roles === undefined) roles = 'patient';

    
    if (req.body.name == null || email === null || password == null || req.body.birth_date == null){
        res.status(401).json({
            message: "name, email and password, image and username cannot be null",
            data : {
                name : req.body.name,
                email : req.body.email,
                password: req.body.password,
                birth_date: req.body.birth_date,
                
            }
        })
    }

    var if_user_exist = await User.findOne({email: email})
    if (if_user_exist){

        res.status(401).json({
            message: "user already exist",
            data : {
                name : req.body.name,
                email : req.body.email,
                password: req.body.password,
                birth_date: req.body.birth_date,
                
            }
        })
        return
    } 


    const newUser = new User({
        name : req.body.name,
        email : req.body.email,
        birth_date: req.body.birth_date,
        roles: roles,
        password: await User.encryptPassword(password)

    })

    const savedUser = await newUser.save();
    console.log(savedUser);


    const newToken = jwt.sign({ id: savedUser._id }, config.secret_key, {
        expiresIn: 86400 // one day
    })


    res.status(200).json({ newToken })
}

const logIn = async (req, res) => {

    const userExist = await User.findOne({ email: req.body.email });


    if (!userExist) return res.status(400).json({
        message: 'User not exists'
    })


    const matchPassword = await User.comparePassword(req.body.password, userExist.password)


    if (!matchPassword) return res.status(401).json({
        token: null,
        message: 'Invalid password'
    })
    console.log(userExist)

    const token = jwt.sign({ id: userExist._id }, config.secret_key, {
        expiresIn: 86400  // one day
    })


    return res.json({
        _id: userExist._id,
        name: userExist.name,
        message: 'Auth Succesful',
        token: token
    })

}



module.exports = {
    logIn,
    signUp
}