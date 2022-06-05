const { findById } = require("../models/medicine");
const Medicine = require("../models/medicine");
const Record = require("../models/Record");
const User = require("../models/user");


// const { recordValidation } = require("../validation/recordValidation");

const add_record = async (req, res) => {
  
  // const { error } = recordValidation(req.body);
  // if (error) return res.status(400).send({ message: error.details[0].message });


  
  var record = new Record({

    date: req.body.date,
    descrption: req.body.descrption,
    medicine: req.body.medicine,
    user: req.body.user

  });
  
  await record.save(function (err, output) {
    if (err) {
      return console.log(err);
    }

    res.status(201).json({
      message: "Created record successfully",
      createdProduct: {
        date: record.date,
        descrption: record.descrption,
        medicine: record.medicine,
        user : record.user
      },
    });
  });
};

const get_patients_records = async (req, res) => {
  
  const id = req.userId;
  try {
    console.log(id);
    var records = await Record.find({user: id});
    return res.json({"records" : records});


  } catch (error) {
    res.status(401).json({
      message: "internal server error",
    });
  }
}


const edit_record = async (req, res) => {

  // const { error } = recordValidation(req.body);
  // if (error) return res.status(400).send({ message: error.details[0].message });


  var rec = await Record.findById(req.body.id);
  if (!rec) {
    res.status(401).json({
      message: "no such records",
    });
    return;
  }

    rec.descrption = req.body.descrption;
    rec.medicine = req.body.medicine;
    rec.date = Date.now;

    await rec.save(function (err) {
        if (err) {
          res.status(404).json({ message: "error occurred during saving" });
        }
      });

    res.status(200).json({
      message: "succesfully edit",
      editedProduct: {
        descrption : rec.descrption,
        medicine : rec.medicine ,
      },
    });  
    };


const delete_record = async (req, res) => {
  try {
    const rec = await Record.findByIdAndRemove(req.params.id);
    // res.redirect('/admin/products')
    
    res.status(200).json({
      message: "succesfully delete record",
      editedProduct: {
        date : rec.date,
        descrption : rec.descrption,
        medicine : rec.medicine ,
        user :  rec.user
      },
    });

  } catch (err) {
    res.status(404).json({ message: "internal server error" });
  }
};


const record_detail = async (req, res) => {
  var rec = await Record.findById(req.params.id);
  if (!rec) {
    res.status(401).json({
      message: "there is no records in the store ",
    });
    return;
  }
  res.status(200).json(rec);
};



module.exports = {
  add_record,
  delete_record,
  edit_record,
  get_patients_records,
  record_detail
};


