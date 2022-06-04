import 'package:equatable/equatable.dart';

class MedicineQuantity extends Equatable {
  String? medicineQuantity;
  MedicineQuantity({required this.medicineQuantity});

  @override
  String toString() {
    return medicineQuantity!;
  }

  @override
  List<Object> get props => [medicineQuantity!];
}
