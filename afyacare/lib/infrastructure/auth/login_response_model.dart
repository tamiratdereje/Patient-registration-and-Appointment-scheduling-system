
class LoginResponse {
  String name;
  String token;

  LoginResponse({required this.name, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(name: json["name"], token: json["token"]);
}
