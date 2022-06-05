class LoginResponse {
  String name;
  String token;
  String role;

  LoginResponse({required this.name, required this.token, required this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        name: json["name"], token: json["token"], role: json["roles"]);
  }
}
