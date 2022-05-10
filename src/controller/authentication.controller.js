const User = require('../models/user.js');
const jwt = require('jsonwebtoken');
const {signupValidation} = require('../validation/signupValidation');



const signUp =  async (req, res) => {

    // console.log(req.file)
    
    const {error} = signupValidation(req.body);
    if(error) return res.status(400).send({message: error.details[0].message});

    
    const emailExist = await User.findOne({email: req.body.email});
    if(emailExist) return res.status(401).json({message: 'User with this email already exists'});

    const hashedPassword = await User.encryptPassword(req.body.password);

    const newUser = new User({
        name : req.body.name,
        email : req.body.email,
        birth_date: req.body.birth_date,
        roles: req.body.roles,
        image: req.file.path,
        password: hashedPassword
    })


    try {
        const savedUser = await newUser.save();
        console.log(savedUser);
    } catch (error) {
        res.status(400).send(error);
    }
    


    const newToken = jwt.sign({ id: savedUser._id }, process.env.SECRET_KEY, {
        expiresIn: 86400 // one day
    })


    res.status(200).json({ newToken })
}

    // email = req.body.email;
    // password = req.body.password;
    // roles = req.body.roles;


    

    // if(roles === undefined || roles === "") roles = 'patient';


    // if (req.body.name == null || email === null || password == null || req.body.birth_date == null){
    //     res.status(401).json({
    //         message: "name, email and password, image and username cannot be null",
    //         data : {
    //             name : req.body.name,
    //             email : req.body.email,
    //             password: req.body.password,
    //             birth_date: req.body.birth_date,
    //             image: req.file.path

                
    //         }
    //     })
    // }

    // var if_user_exist = await User.findOne({email: email})
    // if (if_user_exist){

    //     res.status(401).json({
    //         message: "user already exist",
    //         data : {
    //             name : req.body.name,
    //             email : req.body.email,
    //             password: req.body.password,
    //             birth_date: req.body.birth_date,
                
    //         }
    //     })
    //     return
    // } 


    

   


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

    const token = jwt.sign({ id: userExist._id }, process.env.SECRET_KEY, {
        expiresIn: 86400  // one day
    })


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