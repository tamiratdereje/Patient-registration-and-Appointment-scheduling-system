

import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:afyacare/infrastructure/Schedule/doctor_schedule_model.dart';
import 'package:afyacare/infrastructure/Schedule/patient_schedule_model_response.dart';
import 'package:afyacare/infrastructure/Schedule/update_schedule_domain.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/endpoints/endpoint.dart';
import 'package:http/http.dart' as http;


class ScheduleProvider {


  SharedPref pref = SharedPref();
  
  Future<void> createSchedule(DateTime date) async {
    
    Helper myHelper = Helper(date: date.toString());
    final token = await pref.getToken();

    final response = await http.post(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}"),
    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', "token": token!},
    body: jsonEncode(myHelper)


    );

    if (response.statusCode == 201) {
      print(response.body);
    }

  }

  Future<void> editSchedule(UpdateScheduleModel updateScheduleModel) async {

    final token = await pref.getToken();
    String id = updateScheduleModel.id;

    final response = await http.put(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}/$id"),
    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',  "token": token!},
    body: jsonEncode(updateScheduleModel)
    );
    if (response.statusCode != 200){
        throw Exception('failed to edit');
      }

  }

  Future<void> deleteSchedule(String id) async {
      final token = await pref.getToken();
      final response = await http.delete(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}/$id"),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',  "token": token!},
      );     

      if (response.statusCode != 200){
        print(response.body);
        throw Exception('failed to delete');
      } 
    }


//  for doctor

    Future<List<DoctorScheduleModel>> getDoctorSchedules() async {


        final token = await pref.getToken();
        final response = await http
            .get(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}"),
             headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',  "token": token!},
             );

        if (response.statusCode == 200) {

          final json =jsonDecode(response.body);
          
          
          List<dynamic> list = json["schedules"];
          PatientScheduleModel ll =PatientScheduleModel.fromJson(list[0]) ;
          List<DoctorScheduleModel> ps = [];
          for(int i = 0 ; i < list.length; i++ ){
            ps.add(DoctorScheduleModel.fromJson(list[i]));
          }
          print(ps[0].user.patient_name.toString());
          return ps;
          
        } else {
          throw Exception("error fetching record");
        }

  }

//  for patient
    Future<List<PatientScheduleModel>> getPatientSchedules() async {
        
      print("1111kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");

        final token = await pref.getToken();
        final response = await http
            .get(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}"),
             headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',  "token": token!},
             );

        if (response.statusCode == 200) {

          final json =jsonDecode(response.body);
          
          // print(json.Map((e) => print(e.runtimeType)));
          // print(json.runtimeType);
          List<dynamic> list = json["schedules"];
          print(list.map((e) => PatientScheduleModel.fromJson(e)).runtimeType);
          print(list[0].runtimeType);
          PatientScheduleModel ll =PatientScheduleModel.fromJson(list[0]) ;
          print("77777777777777777777777777777777");
          // print(ll);
          List<PatientScheduleModel> ps = [];
          for(int i = 0 ; i < list.length; i++ ){
            ps.add(PatientScheduleModel.fromJson(list[i]));
          }
          print(ps[0].user.doctor_name.toString());
          return ps;

        } else {
          throw Exception("error fetching record");
        }

  }


}

class Helper{
  String date;
  Helper({required this.date});

  Map<String, dynamic> toJson()=>{
    "date" : date
  };
}