import 'package:equatable/equatable.dart';

class PatientDetailChipList extends Equatable {
  List<String>? patientDetailChipList;
  PatientDetailChipList({required this.patientDetailChipList}) {
    if (this.patientDetailChipList!.isEmpty) {
      throw Exception('Please add medicine!');
    }
  }

  @override
  List<Object> get props => [patientDetailChipList!];
}
