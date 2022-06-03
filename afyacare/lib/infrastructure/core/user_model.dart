import 'dart:convert';

class User{
  String id;
  String email;
  String name;
  String roles;
  String birth_date;

  
  User({required this.email, required this.name , required this.roles , required this.birth_date, required this.id});
  factory User.fromJson(Map<String, dynamic> json) => User(email: json["email"], name: json["name"] , roles: json["roles"] , birth_date: json["birth_date"], id: json["_id"]);
  Map<String, dynamic> toJson() => {"email": email, "name": name, "roles": roles,"birth_date": birth_date, "id": id};
  
  }