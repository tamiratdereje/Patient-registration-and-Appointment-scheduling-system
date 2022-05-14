const joi = require('joi');


const recordValidation = (value) => {
    const recordSchema = joi.object({
        date: joi.date().required(),
        medicine: joi.array(),
        descrption: joi.string(),
        doctor: joi.string().required()
    });
    return recordSchema.validate(value);
}


module.exports.recordValidation = recordValidation;