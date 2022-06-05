import 'package:afyacare/domain/auth/authValidator.dart';
import 'package:afyacare/domain/patient_detail/patient_detail_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
group('patient detail validation', () {
  test('empty chip returns error string', () {
    final result =PatientDetailChipsListValidator().patientDetailChipsListValidator([]);
    expect(result, 'Please add medicine!');
  });
  ;

  test('non-empty chip returns error string', () {

    final result =PatientDetailChipsListValidator().patientDetailChipsListValidator(["diclo"]);
    expect(result, null);
  });

  test('no description or description less than 10 character written returns error string', () {
    final result =PatientDetailDescriptionValidator().patientDetailDescriptionValidator("");
    expect(result, 'Description is too short!');
  });

  test('none alphabetic description returns error string', () {
    final result =PatientDetailDescriptionValidator().patientDetailDescriptionValidator("!@abebe#777ggh!");
    expect(result, 'Enter correct description');
  });

    test('correct description returns error string', () {
    final result =PatientDetailDescriptionValidator().patientDetailDescriptionValidator("you have HIV ");
    expect(result, null);
  });

  });
}