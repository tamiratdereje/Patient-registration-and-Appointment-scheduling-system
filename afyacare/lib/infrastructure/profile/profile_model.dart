class ProfileModel {
  String old_password;
  String new_password;
  ProfileModel({required this.old_password, required this.new_password});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
      old_password: json["old_password"], new_password: json["new_password"]);

  Map<String, dynamic> toJson() =>
      {"old_password": old_password, "new_password": new_password};
}
