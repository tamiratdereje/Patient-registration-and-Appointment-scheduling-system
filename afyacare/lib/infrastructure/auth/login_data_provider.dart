import 'dart:convert';

import 'package:afyacare/infrastructure/auth/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:afyacare/infrastructure/core/user_model.dart';

const baseUrl = 'http://192.168.56.1:3000/api/auth/login';


class ApiClient {
    Future<User> login(LoginUser loginUser) async {
      
      print(loginUser.email);
      print(loginUser.password);
      print("234567890-////////////////**********************************");
      final response = await http.post(Uri.parse(baseUrl),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(loginUser)
      );
      print("afsdg111111111111111111111111--------------------------");
      

      if (response.statusCode == 200){
        print(response.body);
        return User.fromJson(jsonDecode(response.body));
      }
      else {
        throw Exception('Invalid Credential');
  
      }

    }    
}