
class LoginUser {
  String email;
  String password;

  LoginUser({
    required this.email,
    required this.password

  });      
  factory LoginUser.fromJson(Map<String , dynamic> json) => LoginUser(email:
 json["email"], password:json["password"]);

 Map<String , dynamic> toJson() => {
   "email": email , "password": password };

}