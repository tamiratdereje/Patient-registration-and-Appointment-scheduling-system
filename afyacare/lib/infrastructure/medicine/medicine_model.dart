class MedicineModel {
  String name;
  String descrption;
  int quantity;

  MedicineModel({
    required this.name,
    required this.descrption,
    required this.quantity

  });      

  factory MedicineModel.fromJson(Map<String , dynamic> json) => MedicineModel(name:
 json["name"], descrption:json["descrption"], quantity:json["quantity"]);

 Map<String , dynamic> toJson() => {
   "name": name , "quantity": quantity, "descrption": descrption };

}