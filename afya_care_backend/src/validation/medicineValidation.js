const joi = require('joi');



const medicineValidation = (value) => {
    const medicineSchema = joi.object({
        name: joi.string().required().min(3),
        quantity: joi.number().required(),
        descrption: joi.string(),
    });
    return medicineSchema.validate(value);
}

module.exports.medicineValidation = medicineValidation;