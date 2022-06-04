import 'package:equatable/equatable.dart';

class PatientDetailDescription extends Equatable {
  String? patientDetailDescription;
  PatientDetailDescription({required this.patientDetailDescription}) {
     if (this.patientDetailDescription!.length < 10) {
      throw Exception('Description is too short!');
    }
    else if (!RegExp(r'^[a-zA-Z . _ 0-9 ]+$').hasMatch(this.patientDetailDescription!)) {
      throw Exception('Enter correct description');
    }
  }

  @override
  String toString() {
    return patientDetailDescription!;
  }

  @override
  List<Object> get props => [patientDetailDescription!];
}
