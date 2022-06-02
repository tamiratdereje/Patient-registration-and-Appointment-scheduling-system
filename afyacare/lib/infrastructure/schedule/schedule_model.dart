class ScheduleModel {
  String token;
  DateTime selected_date;

  ScheduleModel({
    required this.token,
    required this.selected_date,
  });

  factory ScheduleModel.fromJson(Map<String , dynamic> json) => ScheduleModel(token:
  json["token"], selected_date: DateTime.parse(json["descrption"]));

 Map<String , dynamic> toJson() => {
   "token": token , "selected_date": selected_date };
}