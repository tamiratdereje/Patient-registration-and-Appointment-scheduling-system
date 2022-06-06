class AddDoctorDomainRequest {
  String username;
  String name;
  String birth_date;
  String password;
  String roles;

  AddDoctorDomainRequest({required this.username, required this.name, required this.birth_date, required this.password, required this.roles});
  
  Map<String, dynamic> toJson() => {

        "username": username,
        "password": password,
        "name": name,
        "birth_date": birth_date,
        "roles" : roles

      };
}