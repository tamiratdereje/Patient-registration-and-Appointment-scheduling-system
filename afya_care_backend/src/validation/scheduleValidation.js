const joi = require('joi');



const scheduleValidation = (value) => {
    const scheduleSchema = joi.object({
        date: joi.date().required(),
    });
    const pass = scheduleSchema.validate(value);
    return pass;
}


module.exports.scheduleValidation = scheduleValidation;