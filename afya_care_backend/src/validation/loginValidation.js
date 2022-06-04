const joi = require('joi');

const pattern = new RegExp("^(((?=.*[a-z])(?=.*[A-Z]))|((?=.*[a-z])(?=.*[0-9]))|((?=.*[A-Z])(?=.*[0-9])))(?=.{6,})");

// validator for user login
const loginValidation = (value) => {
    const loginSchema = joi.object({
        username: joi.string().required().min(6),
        password: joi.string().required().min(4)
    });
    return loginSchema.validate(value);
}

module.exports.loginValidation = loginValidation;