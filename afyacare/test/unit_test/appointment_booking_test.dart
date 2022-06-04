import 'package:afyacare/domain/appointment_booking/appointment_booking_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
group('validation login', () {
  test('empty(unpciked) date returns error string', () {
    final result =AppointmentBookingValidator().appointmentBookingValidator('');
    expect(result, ' Please pick a date!');
  });
  ;

  test('non-empty date returns null', () {

    final result =AppointmentBookingValidator().appointmentBookingValidator('2022-06-05 at 06:33');
    expect(result, null);
  });

  });
}