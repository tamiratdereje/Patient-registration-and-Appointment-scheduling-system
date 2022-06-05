const express = require('express');
const authCtrl = require('../controller/authentication.controller');
const router = express.Router();


router.post('/signup', authCtrl.signUp);

router.post('/login', authCtrl.logIn);
router.post('/logout', authCtrl.logout);

module.exports = router;