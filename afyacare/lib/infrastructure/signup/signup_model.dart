class SignupUser {
  String username;
  String fullName;
  String dateOfBirth;
  String password;

  SignupUser({
    required this.username,
    required this.fullName,
    required this.dateOfBirth,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "name": fullName,
        "birth_date": dateOfBirth
      };
}
