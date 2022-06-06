
import 'dart:convert';

import 'package:afyacare/domain/admin_register_user/admin_register_doctor_domian.dart';
import 'package:afyacare/infrastructure/endpoints/endpoint.dart';
import 'package:http/http.dart' as http;

class AdminProvider {
  

Future<void> createUser(AddDoctorDomainRequest doc) async {
print("inside111111111********************");
  final response = await http.post(
        Uri.parse(
            "${EndPoint().baseUrl}${EndPoint().auth}/${EndPoint().signup}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(doc));
print("inside2222222********************");
    if (response.statusCode == 200) {
      print("added");
    } else {
      print("provider");
      throw Exception("adding Failed");
    }

}
}


