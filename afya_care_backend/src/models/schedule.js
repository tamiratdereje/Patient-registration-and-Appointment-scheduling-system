const mongoose = require('mongoose');
const User = require("./user")

const scheduleSchema = new mongoose.Schema({
    date:{
        type:Date,
        required:true,
    },
    patient:{
        required:true,
        type: Schema.Types.ObjectId,
        ref: "User"
    },
    doctor:{
        required:true,
        type: Schema.Types.ObjectId,
        ref: "User"
    }
});

module.exports = mongoose.model("Schedule",scheduleSchema);