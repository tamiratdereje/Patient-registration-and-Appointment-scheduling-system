class LoginUser {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      LoginUser(username: json["username"], password: json["password"]);

  Map<String, dynamic> toJson() => {"username": username, "password": password};
}
