const express = require('express');
// exports.findAllBooks = async (req, res) => {}
// router.get('/', bookCtrl.findAllBooks);


const router = express.Router();

const multer = require("multer");

const storage = multer.diskStorage({
    destination: function(req, file, cb){
       cb(null, './uploads');
    },
    filename: function(req, file, cb){
       // cb(null, file.filename)
       cb(null, new Date().toDateString() + file.originalname);
    }
});

const fileFilter = (req, file, cb)=>{
   if (file.mimetype == 'image/jpeg' || file.mimetype === 'image/png'){
       cb(null, true);
   }else{
       cb(null, false);
   }
};

const upload = multer({
   storage: storage,
   // limits: {
   //     fileSize: 1024 * 1024 *5
   // },
   fileFilter : fileFilter
});
// const upload = multer({dest:'uploads/'});




const authCtrl = require('../controller/authentication.controller');


router.post('/signup',upload.single('profileImage'), authCtrl.signUp);


router.post('/login', authCtrl.logIn);


module.exports = router;