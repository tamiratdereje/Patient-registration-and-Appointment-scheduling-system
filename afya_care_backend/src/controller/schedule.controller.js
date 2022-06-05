const mongoose = require("mongoose");
const Schedule = require("../models/schedule");
const { scheduleValidation } = require("../validation/scheduleValidation");
const scheduleService = require("../service/schedule.service");
const userService = require("../service/user.service");
const user = require("../models/user");

// setting schedule  granted for  patients
const addSchedule = async (req, res) => {
    console.log(req.userId, "-------------------------------------------------------------------")

  const { error } = scheduleValidation(req.body);
  if (error) {
    return res.status(400).send({ message: "why is it not working" });
  }

  var date = new Date(req.body.date);
  const patient = req.userId;

  const [doctor, selected_time] = await scheduleService.findFreeDoctor(
    date.getTime()
  );
  
  console.log("free doctor available :" + doctor + " " + selected_time);
  const selected_date = new Date(selected_time);
  const savedSchedule = await scheduleService.saveSchedule(

    selected_date,
    patient,
    doctor
  );

  
  return res.json(savedSchedule);
};




// get schedule for a patient or doctor correspondigly



const getSchedule = async (req, res) => {
  const role = await userService.role(req.userId);

  if (role === "patient") {
    const schedules = await scheduleService.findUserSchedules(req.userId);

    // await user.findById(schedules[0].patient)

    // res.status(200).json({
    //   schedules: {      
    //     }});

    console.log(schedules);
    return res.json(schedules);

        
  } else if (role === "doctor") {
    const schedules = await scheduleService.findDoctorSchedules(req.userId);
    return res.json(schedules);
  }

};



// update existing schedules
const updateSchedule = async (req, res) => {
  
  console.log("here is  schedule :" + typeof req.params.id);
  const schedule = req.params.id;

  try {
    await addSchedule(req, res);
  } catch (error) {
    return res.json(error);
  }

  try {
    await scheduleService.deleteSchedule(schedule);
  } catch (error) {
    return res.json(error);
  }

};

// delete existing schedule

const deleteSchedule = async (req, res) => {
  const schedule = req.params.id;
  try {
    await scheduleService.deleteSchedule(schedule);
    return res.json({ message: "schedule cancelled successfully" });
  } catch (error) {
    return res.json(error);
  }
};

// fetching taken time spans with no free doctors


module.exports = {
  addSchedule,
  getSchedule,
  updateSchedule,
  deleteSchedule,
};
