import 'package:equatable/equatable.dart';

class PickedTime extends Equatable {
  String? pickedTime;
  PickedTime({required this.pickedTime}) {
    if (this.pickedTime!.isEmpty) {
      throw Exception('Please pick a date!');
    }
  }

  @override
  String toString() {
    return pickedTime!;
  }

  @override
  List<Object> get props => [pickedTime!];
}
