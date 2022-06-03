import 'package:afyacare/domain/Medicine/medicine_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('validation add medicine', () {
    test('empty medicine returns error string', () {
      final result = MedicineValidator().medicineNameValidator('');
      expect(result, 'Enter correct medicine name');
    });

    test('non-empty and correct medicine name returns null', () {
      final result = MedicineValidator().medicineNameValidator('paracetamol');
      expect(result, null);
    });

    test('short medicine description ', () {
      final result = MedicineValidator().medicineDescriptionValidator('para');
      expect(result, 'Description is too short!');
    });

    test('wrong medicine description ', () {
      final result =
          MedicineValidator().medicineDescriptionValidator('@fjs###fjpara');
      expect(result, 'Enter correct medicine description');
    });

    test('correct medicine description name', () {
      final result = MedicineValidator()
          .medicineDescriptionValidator('paracetamol 500g made in ethiopia');
      expect(result, null);
    });
    test('wrong medicine description ', () {
      final result =
          MedicineValidator().medicineQuantityValidator('five');
      expect(result, 'Quantity should be a number!');
    });
  });
}
