const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const { bool } = require('joi');




// Define Schema
const userSchema = new mongoose.Schema({

    name: {
        type: String,
        required: true,
        trim: true
    },

    username: {
        type: String,
        required: true,
        trim: true
    },
    password: {
        type: String,
        required: true,
        trim: true
    },

    roles: {
        type: String,
        required: true,
        default: 'patient',
        enum: ['doctor', 'patient', 'pharmacist','admin']
    },

    birth_date: {
        type: Date,
        required: true
    },    

});

// Hash password before save in DB
userSchema.statics.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(10)
    return await bcrypt.hash(password, salt)
};


// Compare password 
userSchema.statics.comparePassword = async (password, receivedPassword) => {
    return await bcrypt.compare(password, receivedPassword)
};


module.exports = mongoose.model('User', userSchema);