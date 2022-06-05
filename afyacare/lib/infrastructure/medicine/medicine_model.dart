class MedicineModel {
  String name;
  String descrption;
  int quantity;
  String? id;

  MedicineModel(
      {required this.name,
      required this.descrption,
      required this.quantity,
      this.id});

  factory MedicineModel.fromJson(Map<String, dynamic> json) => MedicineModel(
      name: json["name"],
      descrption: json["descrption"],
      quantity: json["quantity"],
      id: json["_id"]);

  Map<String, dynamic> toJson() =>
      {"name": name, "quantity": quantity, "descrption": descrption, "_id": id};
}
