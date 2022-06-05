class RecordModel {
  String dateTime;
  String medicine;
  String descrption;
  String id;
  String patientId;

  RecordModel(
      {required this.dateTime,
      required this.descrption,
      required this.medicine,
      required this.id,
      required this.patientId});

  factory RecordModel.fromJson(Map<String, dynamic> json) => RecordModel(
      descrption: json["descrption"],
      medicine: json["medicine"],
      dateTime: json["date"],
      id: json["_id"],
      patientId: json["user"]);

  Map<String, dynamic> toJson() => {
        "descrption": descrption,
        "medicine": medicine,
        "id": id,
        "patientId": patientId,
        "dateTime": dateTime.toString()
      };
}
