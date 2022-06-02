

const Record = require("../models/Record");
const User = require("../models/user");
const Schedule = require("../models/schedule");


const { profileValidation } = require("../validation/signupValidation");


const edit_user = async (req, res) => {

  // const { error } = profileValidation(req.body);
  // if (error) return res.status(400).send({ message: error.details[0].message });

  var user = await User.findById(req.userId);
  if (!user) {
    res.status(401).json({
      message: "no such user",
    });
    return;
  }

  User.findOne(
    { email: req.body.email, _id: { $ne: req.userId } },
    async function (err, user) {
      if (user) {
        console.log("woge2");
        res.status(404).json({ message: "this user already exist" });
        return;
      }


      User.findById(req.userId, async function (err, existing_user) {
        if (err) {
          res.status(404).json({ message: "user not found" });
          return;
        }

          (existing_user.email = req.body.email),
          await existing_user.save(function (err) {
            if (err) {
              res.status(404).json({ message: "error occurred during saving" });
            }
          });

        res.status(200).json({
          message: "succesfully edit",
          editedProduct: {
            name: existing_user.name,
            email: existing_user.email,
            birth_date: existing_user.birth_date,
          },
        });
      });
    }
  );
};




const edit_password = async (req, res) => {

  var user = await User.findById(req.userId);
  if (!user) {
    res.status(401).json({
      message: "no such user",
    });
    return;
  }

  const matchPassword = await User.comparePassword(req.body.old_password, user.password);

  if (matchPassword){

    const hashedPassword = await User.encryptPassword(req.body.new_password);
    user.password = hashedPassword;
  }

  var existing_user = await User.findById(req.userId);
    res.status(200).json({
      message: "succesfully edit",
      editedProduct: {
        name: existing_user.name,
        email: existing_user.email,
        birth_date: existing_user.birth_date,
        password : existing_user.password
      },
    });

  }



const delete_user = async (req, res) => {

  try {

    await Record.remove({user : req.userId});
    await Schedule.remove({patient : req.userId});
    await Schedule.remove({doctor : req.userId});
    const user = await User.findByIdAndRemove(req.userId);
    
    res.status(200).json({
      message: "succesfully delete",
      editedProduct: {

        name: user.name,
        email: user.email,
        birth_date: user.birth_date,

      },
    });
  } catch (err) {
    res.status(404).json({ message: "internal server error" });
  }
};



const user_detail = async (req, res) => {

  var user = await User.findById(req.userId);
  if (!user) {
    res.status(401).json({
      message: "there is no user with this id ",
    });
    return;
  }

  res.status(200).json(user);

};

module.exports = {
  delete_user,
  edit_user,
  user_detail,
  edit_password
};
