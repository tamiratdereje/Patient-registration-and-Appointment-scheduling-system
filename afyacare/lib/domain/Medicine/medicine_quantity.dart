import 'package:equatable/equatable.dart';

class MedicineQuantity extends Equatable {
  String? medicineQuantity;
  MedicineQuantity({required this.medicineQuantity, required int quantity});

  @override
  String toString() {
    return medicineQuantity!;
  }

  @override
  List<Object> get props => [medicineQuantity!];
}
