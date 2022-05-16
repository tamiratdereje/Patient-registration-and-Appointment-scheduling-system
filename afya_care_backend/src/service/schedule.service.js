
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
    const date = time;
    const busyDoctors = await Schedule.find({date: date});
    const busyDoctorsSet = new Set();
    const doctors = await userService.doctors();

    busyDoctors.forEach((doctor)=>{
        busyDoctorsSet.add(doctor.doctor.valueOf());
    })
    var i = 1

    for(const busdoc of busyDoctors){
        console.log(i + busdoc.doctor)
        i++;
    }


    for(const busedoc of busyDoctorsSet){
        console.log(">>>>>>>> " + busedoc);
    }


    for(const doctor of doctors){
        if(!(busyDoctorsSet.has(doctor._id.valueOf()))){
            console.log(doctor._id)
            return doctor._id;
        }
    }

}



const takenSchedules = async (id)=>{
    const patient = id
    const scheduleList = await getSchedules();
    const scheduleMap = new Map();
    const doctorsCount = await doctorCounter();
    const takenSch = new Array();
    const patientSchedules = await findUserSchedules(patient);



    scheduleList.forEach((schedule)=>{
        if(scheduleMap.has(schedule.date.getTime())){
            scheduleMap.set(schedule.date.getTime(), scheduleMap.get(schedule.date.getTime()) + 1);          
        }else{
            scheduleMap.set(schedule.date.getTime(), 1);     
        }
    })


    for(const [key , value] of scheduleMap){
        if(value >= doctorsCount){
            takenSch.push(key);
        };
    }

    for(const schedule of patientSchedules){
        takenSch.push(schedule.date)
    }

     return takenSch;

}



const findUserSchedules = async (id)=>{
    try {
        const schedules = await Schedule.find({patient:id});
        return schedules;
        
    } catch (error) {
        console.log(error);
    }
}



const findDoctorSchedules = async (id)=>{
    try {
        const schedules = await Schedule.find({doctor:id});
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




module.exports = { takenSchedules, findUserSchedules , findDoctorSchedules , findFreeDoctor , saveSchedule , deleteSchedule }