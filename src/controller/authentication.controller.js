const User = require('../models/user.js');
const jwt = require('jsonwebtoken');
const {signupValidation} = require('../validation/signupValidation');
const {loginValidation} = require('../validation/loginValidation');


const signUp =  async (req, res) => {
    
    // validating signup form input
    const {error} = signupValidation(req.body);
    if(error) return res.status(400).send({message: error.details[0].message});

    //check if email is already in use
    const emailExist = await User.findOne({email: req.body.email});
    if(emailExist) return res.status(401).json({message: 'User with this email already exists'});

    // Hashing user password
    const hashedPassword = await User.encryptPassword(req.body.password);

    //create new user object
    const newUser = new User({
        name : req.body.name,
        email : req.body.email,
        birth_date: req.body.birth_date,
        roles: req.body.roles,
        image: req.file.path,
        password: hashedPassword
    })

    // save created user object
    const savedUser = await newUser.save();
    console.log(savedUser);
            
}

   

    

   


const logIn = async (req, res) => {

    const {error} =  loginValidation(req.body)
    if(error) return res.status(400).json({message: error.details[0].message})

    const userExist = await User.findOne({ email: req.body.email });
    if (!userExist) return res.status(400).json({
        message: 'Invalid credential'
    })


    const matchPassword = await User.comparePassword(req.body.password, userExist.password);
    if (!matchPassword) return res.status(401).json({
        token: null,
        message: 'Invalid credential'
    });

    console.log(userExist)

    const token = jwt.sign({ id: userExist._id }, process.env.SECRET_KEY, {
        expiresIn: 86400  // one day
    })

    res.header("token",token)

    return res.json({
        _id: userExist._id,
        name: userExist.name,
        message: 'Auth Succesful',
        token: token,
        profileImage: userExist.image
    })

    


}



module.exports = {
    logIn,
    signUp
}