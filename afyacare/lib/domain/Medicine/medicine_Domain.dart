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


// class MedicineName {
//   String name;
//   MedicineName({required this.name});

//   @override
//   String toString() {
//     return name;
//   }

// }

// class MedicineDescrption {
//   String descrption;
//   MedicineDescrption({required this.descrption});

//   @override
//   String toString() {
//     return descrption;
//   }
// }

// class MedicineQuantity {
//   int quantity;
//   MedicineQuantity({required this.quantity});

//   @override
//   String toString() {
//     return quantity.toString();
//   }

// }

class MedicineId {
  String id;
  MedicineId({required this.id});

  @override
  String toString() {
    return id.toString();
  }

}