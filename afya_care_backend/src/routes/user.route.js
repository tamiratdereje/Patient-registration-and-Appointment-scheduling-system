const express = require('express');
const user = require('../controller/user.controller');
const router = express.Router();
const authToken = require('../middleware/authToken')


router.delete('/:id', user.delete_user);
router.patch('/:id', user.edit_medicine);
router.get('/:id', user.medicine_detail);


module.exports = router