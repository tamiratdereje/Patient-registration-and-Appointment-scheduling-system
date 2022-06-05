import 'package:afyacare/domain/schedule/schedule_domain_helper.dart';
import 'package:afyacare/infrastructure/Schedule/patient_schedule_model.dart';
import 'package:flutter/foundation.dart';

class DoctorScheduleModel {

  DateTime dateTime;
  DoctorScheduleModelHelper? user;
  String? scheduleId;
  

  DoctorScheduleModel({
    required this.dateTime,
    this.user,
    this.scheduleId
  });


  factory DoctorScheduleModel.fromJson(Map<String , dynamic> json) => DoctorScheduleModel(

    scheduleId: json["_id"],
    dateTime: DateTime.parse(json["date"]),
    user: DoctorScheduleModelHelper.fromJson(json["patient"])

 );

 Map<String , dynamic> toJson() => {
   "date":  dateTime,
   "id": scheduleId
   };
  
}




class DoctorScheduleModelHelper{
  
  String patientId;
  String patient_name;

  DoctorScheduleModelHelper({
    required this.patient_name,
    required this.patientId
    });

    factory DoctorScheduleModelHelper.fromJson(Map<String, dynamic> json) => DoctorScheduleModelHelper(
      patientId: json["_id"],
      patient_name: json["name"]
    );

}