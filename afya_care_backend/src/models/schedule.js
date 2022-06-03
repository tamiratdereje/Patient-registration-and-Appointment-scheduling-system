const { date } = require('joi');
const mongoose = require('mongoose');


const Schedule = mongoose.Schema({
    
    date:{
       type: Date,
       required:true
    },
    doctor:{
        type: mongoose.Schema.Types.ObjectId,
        ref:"User"
    },
    patient:{
        type: mongoose.Schema.Types.ObjectId,
        ref: "User"
    }
})

module.exports = mongoose.model("Schedule",Schedule);