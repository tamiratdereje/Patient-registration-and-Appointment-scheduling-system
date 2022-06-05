import 'package:equatable/equatable.dart';

class MedicineDescription extends Equatable {
  String? medicineDescription;
  MedicineDescription({required this.medicineDescription}) {
    if (!RegExp(r'^[a-zA-Z . _ 0-9 ]+$').hasMatch(this.medicineDescription!)) {
      throw Exception('Enter correct medicine description');
    } else if (this.medicineDescription!.length < 3) {
      throw Exception('Description is too short!');
    }
  }

  @override
  String toString() {
    return medicineDescription!;
  }

  @override
  List<Object> get props => [medicineDescription!];
}
