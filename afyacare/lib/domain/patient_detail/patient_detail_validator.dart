
import 'package:afyacare/domain/patient_detail/patient_detail_chip_list.dart';
import 'package:afyacare/domain/patient_detail/patient_detail_description.dart';

class PatientDetailDescriptionValidator {
  String? patientDetailDescriptionValidator(String? value) {
    try {
      PatientDetailDescription(patientDetailDescription: value);
      return null;
    } catch (e) {
      return e.toString().substring(11);
    }
  }
}

class PatientDetailChipsListValidator {
  String? patientDetailChipsListValidator(List<String>? value) {
    try {
      PatientDetailChipList(patientDetailChipList: value);
      return null;
    } catch (e) {
      return "Please add medicine!";
    }
  }
}
