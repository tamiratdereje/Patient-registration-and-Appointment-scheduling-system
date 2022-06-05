import 'dart:convert';

import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/endpoints/endpoint.dart';
import 'package:afyacare/infrastructure/medicine/medicine_model.dart';
import 'package:http/http.dart' as http;

class MedicineProvider {
  Future<void> createMedicine(MedicineModel medicineModel) async {
    SharedPref pref = SharedPref();
    String? token = await pref.getToken();

    final response = await http.post(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().medicine}'),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token!
        },
        body: jsonEncode(medicineModel));

    if (response.statusCode == 201) {
      print(response.body);
      // return MedicineModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed to create medicine');
    }
  }

  Future<List<MedicineModel>> getAllMedicine() async {
    SharedPref pref = SharedPref();
    final token = await pref.getToken();

    final response = await http.get(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().medicine}'),
        headers: {"Access-Control-Allow-Origin": "*", "token": token!});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json["medicines"];
      final List<MedicineModel> medicines =
          list.map((value) => MedicineModel.fromJson(value)).toList();
      return medicines;
    } else {
      throw Exception("error fetching medicine");
    }
  }

  Future<MedicineModel> getMedicine(String id) async {
    final response = await http.get(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().medicine}'),
        headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {
      return MedicineModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error fetching medicine");
    }
  }

  // deleteMedicine
  Future<void> deleteMedicine(String id) async {
    final response = await http.delete(
      Uri.parse('${EndPoint().medicine}$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    if (response.statusCode != 200) {
      print(response.body);
      throw Exception('failed to delete');
    }
  }

  Future<void> editMedicine(MedicineModel medicineModel) async {
    final response = await http.patch(
        Uri.parse('${EndPoint().medicine}${medicineModel.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(medicineModel));
    if (response.statusCode != 204) {
      throw Exception('failed to to edit');
    }
  }

  Future<MedicineModel> searchMedicine(String name) async {
    print("parahere");
    SharedPref pref = SharedPref();
    final token = await pref.getToken();
    final response = await http.get(
        Uri.parse(EndPoint().baseUrl + EndPoint().medicine + "/med"),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "token": token!,
          "name": name
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      final json = jsonDecode(response.body);
      final med = MedicineModel.fromJson(json);
      return med;
    } else {
      print("throwed");
      throw Exception("error fetching medicine");
    }
  }
}
