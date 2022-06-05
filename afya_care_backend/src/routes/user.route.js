const express = require('express');
const user = require('../controller/user.controller');
const router = express.Router();
const authToken = require('../middleware/authToken')


router.delete('/',[authToken.verifyToken], user.delete_user);
router.get('/',[authToken.verifyToken], user.user_detail);
router.patch('/',[authToken.verifyToken], user.edit_password);

module.exports = router