class RecordModel {
  List<String> medicine;
  String descrption;
  String? id;

  RecordModel({
    required this.descrption,
    required this.medicine,
    this.id

  }); 

  factory RecordModel.fromJson(Map<String , dynamic> json) => RecordModel(

    descrption:json["descrption"],
    medicine: json["medicine"].toList(),
    id: json["id"]

 );

 Map<String , dynamic> toJson() => {
   "descrption":  descrption, "medicine": medicine, "id":id};

}