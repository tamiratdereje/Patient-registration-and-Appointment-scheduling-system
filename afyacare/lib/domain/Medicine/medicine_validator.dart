import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:afyacare/domain/Medicine/medicine_description.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:afyacare/domain/Medicine/medicine_quantity.dart';

class MedicineValidator {
  String? medicineNameValidator(String? value) {
    try {
      MedicineName(medicineName: value!);
      return null;
    } catch (e) {
      return e.toString().substring(11);
    }
  }

  String? medicineQuantityValidator(String? value) {
    try {
      int.parse(value!);
      return null;
    } catch (e) {
      return "Quantity should be number!";
    }
  }

  String? medicineDescriptionValidator(String? value) {
    try {
      MedicineDescription(medicineDescription: value);
      return null;
    } catch (e) {
      return e.toString().substring(11);
    }
  }
}
