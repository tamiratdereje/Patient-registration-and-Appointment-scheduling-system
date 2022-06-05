

import 'dart:convert';
import 'dart:ffi';

import 'package:afyacare/infrastructure/Schedule/doctor_schedule_model.dart';
import 'package:afyacare/infrastructure/Schedule/patient_schedule_model.dart';
import 'package:afyacare/infrastructure/Schedule/update_schedule_domain.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/endpoints/endpoint.dart';
import 'package:http/http.dart' as http;


class ScheduleProvider {


  SharedPref pref = SharedPref();
  
  Future<void> createSchedule(DateTime dateTime) async {
    
    final token = await pref.getToken();

    final response = await http.post(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}"),
    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', "token": token!},
    body: jsonEncode(dateTime)
    );

    if (response.statusCode == 201) {
      print(response.body);
    }

  }

  Future<void> editSchedule(UpdateScheduleDomain updateScheduleDomain) async {

    final token = await pref.getToken();
    String id = updateScheduleDomain.id;

    final response = await http.put(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}/$id"),
    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',  "token": token!},
    body: jsonEncode(updateScheduleDomain)
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
            .get(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}"), headers: {"Access-Control-Allow-Origin": "*",  "token": token!});

        if (response.statusCode == 200) {
          final json =jsonDecode(response.body);
          final List list = json["schedules"];
          final li = list.map((e) => DoctorScheduleModel.fromJson(e)).toList();
          return li;

        } else {
          throw Exception("error fetching record");
        }

  }

//  for patient
    Future<List<PatientScheduleModel>> getPatientSchedules() async {

        final token = await pref.getToken();
        final response = await http
            .get(Uri.parse("${EndPoint().baseUrl}${EndPoint().schedule}"), headers: {"Access-Control-Allow-Origin": "*",  "token": token!});

        if (response.statusCode == 200) {

          final json =jsonDecode(response.body);
          print("************111111***********************");
          print(json);
          final List list = json["schedules"];
          final li = list.map((e) => PatientScheduleModel.fromJson(e)).toList();
          print("1111111111111sbbbbbbbbbbbsbsbsb11111111111111111111111111111111111111111");
          print(li, );
          return li;

        } else {
          throw Exception("error fetching record");
        }

  }


}