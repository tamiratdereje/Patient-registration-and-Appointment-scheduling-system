const scheduleController = require("../controller/schedule.controller");
const authToken = require("../middleware/authToken")
const express = require("express");
const router = express.Router();


router.get("/" ,[authToken.verifyToken],scheduleController.getSchedule);
router.delete("/:id" , scheduleController.deleteSchedule);
router.put("/:id" ,[authToken.verifyToken] ,scheduleController.updateSchedule)
router.post("/" , [authToken.verifyToken],scheduleController.addSchedule);



module.exports = router;

//                      addSchedule,
//                      getAllSchedules,
//                       getSchedule,
//                       updateSchedule,
//                         deleteSchedule,
