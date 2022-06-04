import 'package:equatable/equatable.dart';

class MedicineQuantity extends Equatable {
  int? medicineQuantity;
  MedicineQuantity({required this.medicineQuantity});

  @override
  String toString() {
    return medicineQuantity!.toString();
  }

  @override
  List<Object> get props => [medicineQuantity!];
}
