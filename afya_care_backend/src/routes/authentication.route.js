const express = require('express');
const authCtrl = require('../controller/authentication.controller');
const router = express.Router();
const multer = require("multer");

router.post('/signup', authCtrl.signUp);

router.post('/login', authCtrl.logIn);
router.get('/logout', authCtrl.logout);

module.exports = router;