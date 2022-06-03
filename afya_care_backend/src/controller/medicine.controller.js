const Medicine = require("../models/medicine");
const { medicineValidation } = require("../validation/medicineValidation");

const add_medicine = async (req, res) => {
  const { error } = medicineValidation(req.body);
  if (error) return res.status(400).send({ message: error.details[0].message });

  var med = await Medicine.findOne({ name: req.body.name });
  if (med) {
    res.status(401).json({
      message: "medicine already exist",
    });
    return;
  }
  var medicine = await new Medicine({
    name: req.body.name,
    quantity: req.body.quantity,
    descrption: req.body.descrption,
  });

  await medicine.save(function (err, output) {
    if (err) {
      return console.log(err);
    }

    res.status(201).json({
      message: "Created medicine successfully",
      createdProduct: {
        name: medicine.name,
        quantity: medicine.quantity,
        descrption: medicine.descrption,
      },
    });
  });
};

const edit_medicine = async (req, res) => {
  const { error } = medicineValidation(req.body);
  if (error) return res.status(400).send({ message: error.details[0].message });

  var med = await Medicine.findById(req.params.id);
  if (!med) {
    res.status(401).json({
      message: "no such medicine",
    });
    return;
  }

  Medicine.findOne(
    { name: req.body.name, _id: { $ne: req.body.id } },
    async function (err, med) {
      if (med) {
        console.log("woge2");
        res.status(404).json({ message: "this product already exist" });
        return;
      }


      Medicine.findById(req.body.id, async function (err, existing_med) {
        if (err) {
          res.status(404).json({ message: "medicine not found" });
          return;
        }
        (existing_med.name = req.body.name),
          (existing_med.quantity = req.body.quantity),
          (existing_med.descrption = req.body.descrption),
          await existing_med.save(function (err) {
            if (err) {
              res.status(404).json({ message: "error occurred during saving" });
            }
          });

        res.status(200).json({
          message: "succesfully edit",
          editedProduct: {
            name: existing_med.name,
            quantity: existing_med.quantity,
            descrption: existing_med.descrption,
          },
        });
      });
    }
  );
};



const all_medicine = async (req, res) => {
  var med = await Medicine.find();
  if (!med) {
    res.status(401).json({
      message: "there is no medicine in the store ",
    });
    return;
  }

  res.status(200).json({medicines:med});
};



const delete_medicine = async (req, res) => {
  try {
    const medicine = await Medicine.findByIdAndRemove(req.params.id);
    // res.redirect('/admin/products')

    res.status(200).json({
      message: "succesfully delete",
      editedProduct: {
        name: medicine.name,
        quantity: medicine.quantity,
        descrption: medicine.descrption,
      },
    });
  } catch (err) {
    res.status(404).json({ message: "internal server error" });
  }
};

const medicine_detail = async (req, res) => {
  var med = await Medicine.findById(req.params.id);
  if (!med) {
    res.status(401).json({
      message: "there is no medicine in the store ",
    });
    return;
  }
  res.status(200).json(med);
};

module.exports = {
  add_medicine,
  all_medicine,
  delete_medicine,
  edit_medicine,
  medicine_detail,
};
