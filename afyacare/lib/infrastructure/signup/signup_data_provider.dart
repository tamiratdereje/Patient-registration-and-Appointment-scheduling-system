import 'dart:convert';

import 'package:afyacare/infrastructure/endpoints/endpoint.dart';
import 'package:afyacare/infrastructure/signup/signup_model.dart';
import 'package:http/http.dart' as http;

class SignupDataProvider {
  Future<bool> signup(SignupUser signupUser) async {
    final response = await http.post(
        Uri.parse(
            "${EndPoint().baseUrl}${EndPoint().auth}/${EndPoint().signup}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(signupUser));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Signup Failed");
    }

  }
}
