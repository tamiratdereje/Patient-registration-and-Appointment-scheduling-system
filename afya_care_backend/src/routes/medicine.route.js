const express = require('express');
const medicine = require('../controller/medicine.controller');
const router = express.Router();
const authToken = require('../middleware/authToken')

router.post('/', medicine.add_medicine);
router.get('/',medicine.all_medicine);
router.delete('/:id', medicine.delete_medicine);
router.patch('/:id', medicine.edit_medicine);
router.get('/:id', medicine.medicine_detail);


module.exports = router