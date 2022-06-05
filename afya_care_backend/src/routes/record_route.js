const express = require('express');


const record = require('../controller/record_contoller');
const router = express.Router();
const authToken = require('../middleware/authToken')



router.post('/',[authToken.verifyToken], record.add_record);
router.get('/',[authToken.verifyToken],record.get_patients_records)
// router.get('/:patientId',[authToken.verifyToken], record.get_patients_records);
router.delete('/:id',[authToken.verifyToken], record.delete_record);
router.patch('/',[authToken.verifyToken], record.edit_record);
module.exports = router;
