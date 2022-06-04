import 'package:afyacare/domain/schedule/schedule_domain_helper.dart';
import 'package:afyacare/infrastructure/Schedule/schedule_model_helper.dart';
import 'package:flutter/foundation.dart';

class ScheduleModel {
  DateTime dateTime;
  ScheduleModelHelper? name_of_user;
  String? scheduleId;

  ScheduleModel({
    required this.dateTime,
    this.name_of_user,
    this.scheduleId
  });


  factory ScheduleModel.fromJson(Map<String , dynamic> json) => ScheduleModel(

    scheduleId: json["_id"],
    name_of_user: json["user"].toList(),
    dateTime: DateTime.parse(json["date"]),

 );

 Map<String , dynamic> toJson() => {
   "date":  dateTime,
   };
  
}



  

