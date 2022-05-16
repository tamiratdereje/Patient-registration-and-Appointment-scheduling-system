const express = require('express');
// exports.findAllBooks = async (req, res) => {}
// router.get('/', bookCtrl.findAllBooks);
const authToken = require('../middleware/authToken');


const router = express.Router();


router.get('/check',[authToken.verifyToken]);


module.exports = router;