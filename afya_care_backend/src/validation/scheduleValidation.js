const joi = require('joi');



const scheduleValidation = (value) => {
    const scheduleSchema = joi.object({
        date: joi.date().required(),
    });
    return scheduleSchema.validate(value);
}


module.exports.scheduleValidation = scheduleValidation;