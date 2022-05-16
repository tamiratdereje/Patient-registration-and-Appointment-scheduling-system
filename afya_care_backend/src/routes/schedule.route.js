const express = require('express');

const router = express.Router();


router.get('/check',[authToken.verifyToken]);


module.exports = router;