const express = require('express');
const medicine = require('../controller/medicine.controller');
const record = require('../controller/record_contoller');
const router = express.Router();


router.post('/', record.add_record);
// router.get('/', record.all_record);
router.delete('/:id', record.delete_record);
router.patch('/:id', record.edit_record);
module.exports = router