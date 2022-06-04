import 'package:equatable/equatable.dart';

class DateOfBirth extends Equatable {
  String? dateOfBirth;

  DateOfBirth({required this.dateOfBirth}) {
    if (dateOfBirth!.isEmpty) {
      throw Exception('Pick date of birth');
    }
  }

  @override
  String toString() {
    return dateOfBirth!;
  }

  @override
  List<Object> get props => [dateOfBirth!];
}
