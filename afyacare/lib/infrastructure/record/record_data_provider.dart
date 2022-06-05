import 'dart:convert';

import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/medicine/medicine_model.dart';
import 'package:afyacare/infrastructure/record/record_model.dart';

import 'package:http/http.dart' as http;

import 'package:afyacare/infrastructure/endpoints/endpoint.dart';

class RecordProvider {
  SharedPref pref = SharedPref();
  Future<void> createRecord(RecordModel recordModel) async {
    final response = await http.post(
        Uri.parse("${EndPoint().baseUrl}${EndPoint().record}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(recordModel));

    if (response.statusCode == 200) {
      print(response.body);
      // return RecordModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to create record');
    }
  }

  // get specific record
  Future<RecordModel> getRecord(String id) async {
    final response = await http.get(
        Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$id"),
        headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {
      return RecordModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error fetching medicine");
    }
  }

  // Future<List<RecordModel>> getAllRecord(String? patientId) async {
  //   final token = await pref.getToken();

  //   final response;
  //   if (patientId == null) {
  //     response = await http.get(
  //         Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/"),
  //         headers: {"Access-Control-Allow-Origin": "*", "token": token!});
  //   } else {
  //     response = await http.get(
  //         Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$patientId"),
  //         headers: {"Access-Control-Allow-Origin": "*", "token": token!});
  //   }

  //   try {
  //     if (response.statusCode == 200) {
  //       print("^^^^^^^^^^^^^^^^^^^^^^^^^^");
  //       final json = jsonDecode(response.body);
  //       List<RecordModel> recordModel = [];
  //       print(json[0].runtimeType);
  //       for (int i = 0; i < json.length; i++) {
  //         recordModel.add(
  //             json[i].map((value) => RecordModel.fromJson(jsonDecode(value))));
  //       }
  //       print(recordModel);
  //       return recordModel;
  //     } else {
  //       throw Exception("error fetching record");
  //     }
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

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
    print(response.statusCode);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print(json);
      final Iterable list = json["records"];
      print(list);
      final List<RecordModel> records =
          list.map((value) => RecordModel.fromJson(value)).toList();

      print('\n');
      print(records);
      return records;
    } else {
      throw Exception("error fetching medicine");
    }
  }

  // deleteRecord
  Future<void> deleteRecord(String id) async {
    final response = await http.delete(
      Uri.parse("${EndPoint().baseUrl}${EndPoint().record}/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode != 204) {
      print(response.body);
      throw Exception('failed to delete');
    }
  }

  Future<void> editRecord(RecordModel recordModel) async {
    final response = await http.patch(
        Uri.parse("${EndPoint().baseUrl}${EndPoint().record}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(recordModel));

    if (response.statusCode != 204) {
      throw Exception('failed to to edit');
    }
  }




  Future<List<MedicineModel>> getMyRecord() async {
    SharedPref pref = SharedPref();
    final token = await pref.getToken();

    final response = await http.get(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().record}'),
        headers: {"Access-Control-Allow-Origin": "*", "token": token!});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List list = json["medicines"];
      final List<MedicineModel> medicines =
          list.map((value) => MedicineModel.fromJson(value)).toList();
      return medicines;
    } else {
      throw Exception("error fetching medicine");
    }
  }
}


