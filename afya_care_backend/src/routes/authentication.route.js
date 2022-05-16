const express = require('express');
const authCtrl = require('../controller/authentication.controller');
const router = express.Router();
const multer = require("multer");


//assigning storage for uploading files
const storage = multer.diskStorage({
    destination: function(req, file, cb){
       cb(null, './uploads');
    },
    filename: function(req, file, cb){
       cb(null, new Date().toDateString() + file.originalname);
    }
});


//filtering file type
const fileFilter = (req, file, cb)=>{
   if (file.mimetype == 'image/jpeg' || file.mimetype === 'image/png'){
       cb(null, true);
   }else{
       cb(null, false);
   }
};
// hello abel ere check aregewu


//upload file
const upload = multer({
   storage: storage,
   fileFilter : fileFilter
});


router.post('/signup',upload.single('profileImage'), authCtrl.signUp);
router.post('/login', authCtrl.logIn);
module.exports = router;