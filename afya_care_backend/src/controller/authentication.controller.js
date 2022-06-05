const User = require('../models/user.js');
const jwt = require('jsonwebtoken');
const {signupValidation} = require('../validation/signupValidation');
const {loginValidation} = require('../validation/loginValidation');


const signUp =  async (req, res) => {
    
    // validating signup form input
    
   
    const {error} = signupValidation(req.body);
    if(error) return res.status(400).send({message: error.details[0].message});

    //check if email is already in use
    const emailExist = await User.findOne({username: req.body.username});
    
    if(emailExist) return res.status(401).json({message: 'User with this email already exists'});

    // Hashing user password
    const hashedPassword = await User.encryptPassword(req.body.password);

    //create new user object
    const newUser = new User({
        name : req.body.name,
        username : req.body.username,
        birth_date: req.body.birth_date,
        roles: req.body.roles,
        password: hashedPassword
    })

    // save created user object
    const savedUser = await newUser.save();
    console.log(savedUser);

    res.json({message: "user account created successfully"});
            
}

   

    

   

//login logics found in here
const logIn = async (req, res) => {

    const {error} =  loginValidation(req.body)
    if(error) return res.status(400).json({message: error.details[0].message})

    const userExist = await User.findOne({ username: req.body.username });
    if (!userExist) return res.status(400).json({
        message: 'Invalid credential'
    })


    const matchPassword = await User.comparePassword(req.body.password, userExist.password);
    print(!matchPassword);
    if (!matchPassword) return res.status(401).json({
        token: null,
        message: 'Invalid credential'
    });

    console.log(userExist)

    const token = jwt.sign({ id: userExist._id }, process.env.SECRET_KEY, {
         // one day
    })

    res.header("token",token)
    console.log(userExist);

    return res.json({
        _id: userExist._id,
        name: userExist.name,
        birth_date: userExist.birth_date,
        username:userExist.username,
        message: 'Auth Succesful',
        token: token,
        roles:userExist.roles
        // profileImage: userExist.image
    })


}

const logout = async (req, res) => {
    res.header("token","");
    return res.status(200).json({
        message : "you are logged out"
    })

}


module.exports = {
    logIn,
    signUp,
    logout
}