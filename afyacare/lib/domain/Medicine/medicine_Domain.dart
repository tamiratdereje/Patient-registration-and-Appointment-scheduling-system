import 'package:afyacare/domain/Medicine/medicine_description.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:afyacare/domain/Medicine/medicine_quantity.dart';

class MedicineDomain {
  MedicineName name;
  MedicineDescription descrption;
  MedicineQuantity quantity;
  MedicineId? id;


  MedicineDomain({
    required this.name,
    required this.descrption,
    required this.quantity,
    this.id
  });

}

class MedicineId {
  String id;
  MedicineId({required this.id});

  @override
  String toString() {
    return id.toString();
  }

}