import 'package:equatable/equatable.dart';

class MedicineName extends Equatable {
  String? medicineName;
  MedicineName({required this.medicineName}) {
    if (this.medicineName!.length < 2 || !RegExp(r'^[a-zA-Z . 0-9]+$').hasMatch(this.medicineName!) ) {
      throw Exception('Enter correct medicine name');
    }
  }

  @override
  String toString() {
    return medicineName!;
  }

  @override
  List<Object> get props => [medicineName!];
}
