const { findById } = require("../models/medicine");
const Medicine = require("../models/medicine");
const Record = require("../models/Record");
const User = require("../models/user");


const { recordValidation } = require("../validation/recordValidation");

const add_record = async (req, res) => {
  const { error } = recordValidation(req.body);
  if (error) return res.status(400).send({ message: error.details[0].message });


  
  var record = new Record({
    date: req.body.date,
    descrption: req.body.descrption,
    medicine: req.body.medicine,
    doctor: req.body.doctor
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
        doctor : record.doctor
      },
    });
  });
};



const edit_record = async (req, res) => {
  const { error } = recordValidation(req.body);
  if (error) return res.status(400).send({ message: error.details[0].message });

  var doctor = await User.findById(req.body.doctor)
  if (!doctor){
      res.status(401).json({
          message : "no such doctor exist"
      })
      return
  }

  var rec = await Record.findById(req.params.id);
  if (!rec) {
    res.status(401).json({
      message: "no such medicine",
    });
    return;
  }
    rec.date = req.body.date;
    rec.descrption = req.body.descrption;
    rec.medicine = req.body.medicine;
    rec.doctor = req.body.doctor;

    await rec.save(function (err) {
        if (err) {
          res.status(404).json({ message: "error occurred during saving" });
        }
      });

    res.status(200).json({
      message: "succesfully edit",
      editedProduct: {
        date : rec.date,
        descrption : rec.descrption,
        medicine : rec.medicine ,
        doctor :  rec.doctor
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
        doctor :  rec.doctor
      },
    });

  } catch (err) {
    res.status(404).json({ message: "internal server error" });
  }
};

module.exports = {
  add_record,
  delete_record,
  edit_record,
};
