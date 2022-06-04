const Schedule = require('../models/schedule');
const { findByIdAndDelete } = require('../models/user');
const User = require('../models/user');
const userService = require('./user.service');

const doctorCounter = async ()=>{
    try {
        const doctorCount = await User.count({roles: "doctor"});
        console.log("doctors :" + doctorCount);
        return doctorCount;
    } catch (error) {
        console.log("unable to count");
    }    
}



const getSchedules = async ()=>{
    try {
        const schedules = await Schedule.find();
        console.log("schedules :" + schedules);
        return schedules;
        
    } catch (error) {
        console.log("unable to find schedules")
    }
}



const findFreeDoctor = async (time)=>{

    const busyDoctors = await Schedule.find({date: new Date(time)});
    const busyDoctorsSet = new Set();
    const doctors = await userService.doctors();

    busyDoctors.forEach((doctor)=>{
        busyDoctorsSet.add(doctor.doctor.valueOf());
    });

    for(const doctor of doctors){
        if(!(busyDoctorsSet.has(doctor._id.valueOf()))){
            return [doctor._id, time];
        }
    }

    return findFreeDoctor(time + 3600000);

}

/*, date: {$gte: new Date(Date.now())}*/

const findUserSchedules = async (id)=>{
    try {
    var schedules = await Schedule.find({patient:id}).populate("doctor");
    return schedules;
        
    } catch (error) {
        console.log(error);
    }
}


const findDoctorSchedules = async (id)=>{
    try {
        // {patient:id, date: {$gte: new Date(Date.now())}}
        const schedules = await Schedule.find({doctor:id /*, date: {$gte: new Date(Date.now())}*/}).populate("patient");
        return schedules;
        
    } catch (error) {
        console.log(error);
    }
}



const saveSchedule = async (date,patient,doctor)=>{
    const schedule = new Schedule({
        date:date,
        patient: patient,
        doctor:doctor
    })
    const savedSchedule = await schedule.save();
    return savedSchedule;
}


const deleteSchedule = async (id)=>{
    try{
    const schedule = await Schedule.findByIdAndDelete(id);
    return schedule

    }
    catch(error){
        console.log(error);
        return
    }
}



module.exports = {  findUserSchedules , findDoctorSchedules , findFreeDoctor , saveSchedule , deleteSchedule }