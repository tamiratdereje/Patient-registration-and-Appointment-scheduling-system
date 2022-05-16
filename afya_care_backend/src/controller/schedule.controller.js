const mongoose = require("mongoose");
const Schedule = require("../models/schedule");
const { scheduleValidation} = require("../validation/scheduleValidation");
const  scheduleService = require('../service/schedule.service')
const userService = require('../service/user.service');



// setting schedule  granted for  patients
const addSchedule = async (req , res)=>{
    
    const {error} = scheduleValidation(req.body);
    if(error){
        return res.status(400).send({message: "why is it not working"})
    }

    const date = req.body.date;
    const patient = req.userId;
    const doctor = await scheduleService.findFreeDoctor(req.body.date);
    console.log("free doctor available :" + doctor)
   
    const savedSchedule = await scheduleService.saveSchedule( date , patient , doctor );
    return res.json(savedSchedule);

}


// get schedule for a patient or doctor correspondigly
const getSchedule = async (req , res)=>{
    const role = await userService.role(req.userId);

    if(role === "patient"){
        const schedules =await scheduleService.findUserSchedules(req.userId);
        return res.json(schedules);
    }
    else if(role === "doctor"){
        const schedules = await scheduleService.findDoctorSchedules(req.userId);
        return  res.json(schedules);
    }

}


// get all existing schedules
const getAllSchedules = async (req , res)=>{
    const schedules = await Schedule.find();
    const tknSchedules = await scheduleService.takenSchedules();
    console.log(tknSchedules);
    res.json(schedules);
}


// update existing schedules
const updateSchedule = async (req , res)=>{

    console.log("here is  schedule :" + typeof req.params.id)
    const schedule = req.params.id;

    try{
      await addSchedule(req , res);
    }catch(error){
        return res.json(error)  }

    try {
          await scheduleService.deleteSchedule(schedule);      
    } catch (error) {
        return res.json(error)  }

    return await scheduleService.takenSchedules()  
}





// delete existing schedule
const deleteSchedule = async (req , res)=>{
    const schedule = req.params.id
    try {
        
        await scheduleService.deleteSchedule(schedule);
        return res.json({message:"schedule cancelled successfully"});

    } catch (error) {
        return res.json(error);
    }
}




// fetching taken time spans with no free doctors
const takenSchedules = async (req , res)=>{
    const id = req.userId;
    const takenSchedules = await scheduleService.takenSchedules(id);
    return res.json(takenSchedules);
}




module.exports = {
    addSchedule,
    getAllSchedules,
    getSchedule,
    updateSchedule,
    deleteSchedule,
    takenSchedules
}