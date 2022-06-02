import 'dart:convert';

import 'package:afyacare/infrastructure/medicine/medicine_model.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://192.168.56.1:3000/medicine';


class MedicineProvider {

    Future<MedicineModel> createMedicine(MedicineModel medicineModel) async {
      
      final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(medicineModel)
      );     

      if (response.statusCode == 200){
        print(response.body);
        return MedicineModel.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception('Invalid Credential');
      }
    }
    

  Future<List<MedicineModel>> getAllMedicine() async {
    final response = await http
        .get(Uri.parse(baseUrl), headers: {"Access-Control-Allow-Origin": "*"});
    print(response.statusCode);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Iterable list = json["medicines"];

      return list.map((value) => MedicineModel.fromJson(value)).toList();
    } else {
      throw Exception("error fetching medicine");
    }
  }

  Future<MedicineModel> getMedicine(String name) async {

    final response = await http
        .get(Uri.parse('$baseUrl/$name'), headers: {"Access-Control-Allow-Origin": "*"});

    if (response.statusCode == 200) {
      return MedicineModel.fromJson(jsonDecode(response.body));

    } else {
      throw Exception("error fetching medicine");
    }
  }
  // deleteMedicine
  Future<void> deleteMedicine(String id) async {

      final response = await http.delete(Uri.parse('$baseUrl/$id'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
      );     

      if (response.statusCode != 204){
        print(response.body);
        throw Exception('failed to delete');
      } 
    }

  Future<void> editMedicine(MedicineModel medicineModel) async {
        final response = await http.patch(Uri.parse(baseUrl),
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(medicineModel)
      );
      if (response.statusCode != 204){
        throw Exception('failed to to edit');
      }
    }

}