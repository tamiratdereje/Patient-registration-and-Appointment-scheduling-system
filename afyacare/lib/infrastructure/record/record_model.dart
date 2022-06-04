class RecordModel{
  
  DateTime? dateTime;
  List<String> medicine;
  String descrption;
  String? id;
  String? patientId;

  RecordModel({
    
    this.dateTime,
    required this.descrption,
    required this.medicine,
    this.id,
    this.patientId

  });
  
  factory RecordModel.fromJson(Map<String , dynamic> json) => RecordModel(

    descrption:json["descrption"],
    medicine: json["medicine"].toList(),
    dateTime: DateTime.parse(json["date"]),
    id: json["id"],
    patientId: json["patientId"]

 );

 Map<String , dynamic> toJson() => {
   "descrption":  descrption, "medicine": medicine, "id":id, "patientId": patientId,
   };

}