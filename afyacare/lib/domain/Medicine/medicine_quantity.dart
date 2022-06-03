import 'package:equatable/equatable.dart';

class MedicineQuantity extends Equatable {
  String? medicineQuantity;
  MedicineQuantity({required this.medicineQuantity}) {
    if (this.medicineQuantity!.isEmpty || !RegExp(r'^[a-zA-Z . 0-9]+$').hasMatch(this.medicineQuantity!) ) {
      throw Exception('Enter correct medicine quantity');
    }
  }

  @override
  String toString() {
    return medicineQuantity!;
  }

  @override
  List<Object> get props => [medicineQuantity!];
}
