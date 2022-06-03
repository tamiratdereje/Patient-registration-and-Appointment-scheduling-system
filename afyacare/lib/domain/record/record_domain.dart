class RecordModel {
  DateTime dateTime;
  List<String> medicine;
  String descrption;
  String patientId;
  String? id;

  RecordModel({
    required this.dateTime,
    required this.descrption,
    required this.patientId,
    required this.medicine,
    this.id

  }); 

  factory RecordModel.fromJson(Map<String , dynamic> json) => RecordModel(

    patientId:json["patientId"],
    descrption:json["descrption"],
    medicine: json["medicine"].toList(),
    dateTime: DateTime.parse(json["quantity"]) ,
    id: json["id"]
    
 );

 Map<String , dynamic> toJson() => {
   "descrption":  descrption, "patientId": patientId, "medicine": medicine,"date": dateTime, "id":id};

}