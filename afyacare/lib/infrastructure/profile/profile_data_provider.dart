import 'dart:convert';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/infrastructure/endpoints/endpoint.dart';
import 'package:afyacare/infrastructure/profile/profile_model.dart';
import 'package:http/http.dart' as http;

class ProfileDataProvider {
  Future<void> editPassword(ProfileModel profileModel) async {
    SharedPref pref = SharedPref();
    String? token = await pref.getToken();

    final response = await http.patch(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().profile}'),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token!
        },
        body: jsonEncode(profileModel));

    if (response.statusCode == 200) {
    } else {
      throw Exception('failed to change password');
    }
  }

  Future<void> delete() async {
    SharedPref pref = SharedPref();
    String? token = await pref.getToken();

    final response = await http.delete(
        Uri.parse('${EndPoint().baseUrl}${EndPoint().profile}'),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token!
        });

    if (response.statusCode == 200) {
    } else {
      throw Exception('failed to change password');
    }
  }

  Future<void> logout() async {
    SharedPref pref = SharedPref();
    String? token = await pref.getToken();
  
    final response = await http.post(
        Uri.parse(
            '${EndPoint().baseUrl}${EndPoint().auth}/${EndPoint().logout}'),
        headers: <String, String>{
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token!
        });

    if (response.statusCode == 200) {
    } else {
      throw Exception('failed to logout');
    }
  }
}
