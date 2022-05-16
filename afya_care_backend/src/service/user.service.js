const { findById } = require('../models/user');
const User = require('../models/user');


const doctors = async ()=>{
    try {

        const doctorsList = await User.find({roles: "doctor"});
        return doctorsList
        
    } catch (error) {
        console.log(error);  
    }
}

const role = async (id)=>{
    try {
        const user = await User.findById(id);
        const role = user.roles;
        return role;
    } catch (error) {
        console.log(error)
    }
}

module.exports = {doctors , role};