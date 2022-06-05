const express = require('express');
const medicine = require('../controller/medicine.controller');
const router = express.Router();
const authToken = require('../middleware/authToken')

router.get('/med',[authToken.verifyToken], medicine.get_medicines);
router.post('/',[authToken.verifyToken], medicine.add_medicine);
router.get('/',[authToken.verifyToken],medicine.all_medicine);
router.delete('/:id',[authToken.verifyToken], medicine.delete_medicine);
router.patch('/:id',[authToken.verifyToken], medicine.edit_medicine);
router.get('/:id',[authToken.verifyToken], medicine.medicine_detail);



module.exports = router