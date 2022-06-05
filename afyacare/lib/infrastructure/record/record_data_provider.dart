import 'dart:convert';

import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/medicine/medicine_model.dart';
import 'package:afyacare/infrastructure/record/record_model.dart';

import 'package:http/http.dart' as http;

import 'package:afyacare/infrastructure/endpoints/endpoint.dart';

class RecordProvider {
  SharedPref pref = new SharedPref();

  Future<void> createRecord(RecordModel recordModel) async {
    final token = await pref.getToken();

    final response = await http.post(
        Uri.parse("${EndPoint().baseUrl}${EndPoint().record}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "token": token!
        },
        body: jsonEncode(recordModel));

    if (response.statusCode == 201) {
      print(response.body);
      // return RecordModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to create record');
    }
  }

  // get specific record
  Future<RecordModel> getRecord(String id) async {
    final token = await pref.getToken();
    final response = await http.get(
        Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$id"),
        headers: {"Access-Control-Allow-Origin": "*", "token": token!});

    if (response.statusCode == 200) {
      return RecordModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error fetching medicine");
    }
  }

//  tane
  Future<List<RecordModel>> getAllRecord() async {
    SharedPref pref = SharedPref();
    final token = await pref.getToken();
    print(token);
    final response = await http.get(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().record}'),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          "token": token!,
          'Content-Type': 'application/json; charset=UTF-8'
        });
    

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      final Iterable list = json["records"];
      print(list);
      final List<RecordModel> records =
          list.map((value) => RecordModel.fromJson(value)).toList();

     
      return records;
    } else {
      throw Exception("error fetching medicine");
    }
  }




}
