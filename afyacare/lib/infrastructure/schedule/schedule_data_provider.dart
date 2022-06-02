import 'dart:convert';

import 'package:afyacare/infrastructure/schedule/schedule_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://192.168.56.1:3000/schedule';



class ScheduleProvider {

    Future<void> createSchedule(ScheduleModel scheduleModel) async {

      final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(scheduleModel)
      );     

      if (response.statusCode == 200){
        print(response.body);
        ScheduleModel.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception('failed to create schedule');
      }

    }
//   this is for doctor and patient to receive all schedule 
    Future<List<ScheduleModel>> getSchedule(String token) async {

      final response = await http
          .get(Uri.parse('$baseUrl/$token'), headers: {"Access-Control-Allow-Origin": "*"});
      print(response.statusCode);


      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final Iterable list = json["schedules"];

        return list.map((value) => ScheduleModel.fromJson(value)).toList();
      } else {
        throw Exception("error fetching medicine");
      }   
  }

  Future<void> deleteSchedule(String id) async {

      final response = await http.delete(Uri.parse('$baseUrl/$id'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      );     

      if (response.statusCode != 204){
        print(response.body);
        throw Exception('failed to delete');
      } 
    }

    Future<void> editSchedule(ScheduleModel scheduleModel) async {

        final response = await http.patch(Uri.parse(baseUrl),
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(scheduleModel)
      );

      if (response.statusCode != 204){
        throw Exception('failed to to edit');
      }

    }
}