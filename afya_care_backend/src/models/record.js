const mongoose = require('mongoose');

// Define Schema
const recordSchema = new mongoose.Schema({

    date: {
        type: Date,
        required: true,
        default : Date.now
    },

    descrption: {
        type: String,
        required: false
    },
    
    medicine : {
        type: String,
        required: false
    },

    user : {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User"
    }

});


module.exports = mongoose.model('Record', recordSchema);