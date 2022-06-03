const joi = require('joi');


const recordValidation = (value) => {
    const recordSchema = joi.object({
        date: joi.date(),
        medicine: joi.array(),
        descrption: joi.string(),
        
    });
    return recordSchema.validate(value);
}


module.exports.recordValidation = recordValidation;