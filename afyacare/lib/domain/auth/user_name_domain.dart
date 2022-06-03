import 'package:equatable/equatable.dart';

class Username extends Equatable {
  String? username;
  Username({required this.username}) {
    if (this.username!.length < 3) {
      throw Exception('Invalid username');
    }
  }

  @override
  String toString() {
    return username!;
  }

  @override
  List<Object> get props => [username!];
}
