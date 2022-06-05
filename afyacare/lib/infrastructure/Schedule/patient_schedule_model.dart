import 'package:afyacare/domain/schedule/schedule_domain_helper.dart';
import 'package:afyacare/infrastructure/Schedule/patient_schedule_model.dart';
import 'package:flutter/foundation.dart';

class PatientScheduleModel {

  DateTime dateTime;
  PatientScheduleModelHelper? user;
  String? scheduleId;
  

  PatientScheduleModel({
    required this.dateTime,
    this.user,
    this.scheduleId
  });


  factory PatientScheduleModel.fromJson(Map<String , dynamic> json) => PatientScheduleModel(

    scheduleId: json["_id"],
    dateTime: DateTime.parse(json["date"]),
    user: PatientScheduleModelHelper.fromJson(json["doctor"])

 );

 Map<String , dynamic> toJson() => {
   "date":  dateTime,
   "id": scheduleId
   };
  
}



  


class PatientScheduleModelHelper{
  
  String doctorId;
  String doctor_name;
  PatientScheduleModelHelper({
    required this.doctor_name,
    required this.doctorId
    });

    factory PatientScheduleModelHelper.fromJson(Map<String, dynamic> json) => PatientScheduleModelHelper(
      doctorId: json["_id"],
      doctor_name: json["name"]
    );

}