import 'package:afyacare/domain/appointment_booking/time_domain.dart';

class AppointmentBookingValidator {
  String? appointmentBookingValidator(String? value) {
    try {
      PickedTime(pickedTime: value);
      return null;
    } catch (e) {
      return e.toString().substring(10);
    }
  }
}
