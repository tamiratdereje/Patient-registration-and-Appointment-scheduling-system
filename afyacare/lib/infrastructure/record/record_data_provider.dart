import 'dart:convert';

import 'package:afyacare/infrastructure/medicine/medicine_model.dart';
import 'package:afyacare/infrastructure/record/record_model.dart';

import 'package:http/http.dart' as http;

import 'package:afyacare/infrastructure/endpoints/endpoint.dart';

class RecordProvider {
    
    Future<void> createRecord(RecordModel recordModel) async {

      final response = await http.post(
        Uri.parse("${EndPoint().baseUrl}${EndPoint().record}"),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(recordModel)
      );

      if (response.statusCode == 200){
        print(response.body);
        // return RecordModel.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception('failed to create record');
      }

    }
    
    // get specific record
   Future<RecordModel> getRecord(String id) async {

    final response = await http
        .get(Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$id"), headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {
      return RecordModel.fromJson(jsonDecode(response.body));

    } else {
      throw Exception("error fetching medicine");
    }
  }

  Future<List<RecordModel>> getAllRecord(String patientId) async {

    final response = await http
        .get(Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$patientId"), headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {

      final json = jsonDecode(response.body);
      final Iterable list = json["records"];

      return list.map((value) => RecordModel.fromJson(value)).toList();

    } else {
      throw Exception("error fetching record");
    }
  }

  // deleteRecord
  Future<void> deleteRecord(String id) async {

      final response = await http.delete(Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$id"),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      );     

      if (response.statusCode != 204){
        print(response.body);
        throw Exception('failed to delete');
      } 
    }

  Future<void> editRecord(RecordModel recordModel) async {
        final response = await http.patch(
          Uri.parse("${EndPoint().baseUrl}${EndPoint().record}"),
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(recordModel)
      );

      if (response.statusCode != 204){
        throw Exception('failed to to edit');
      }

    }


}