import 'package:afyacare/presentation/pages/appointment/appointment_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Appointment screen widget test', (WidgetTester tester) async {
    
    final addDate = find.byKey(const ValueKey("date"));
    
    final submitButton = find.byKey(const ValueKey("submit"));

    await tester.pumpWidget(const MaterialApp(home: AppointmentBooking()));

    await tester.tap(submitButton);

    expect(addDate, findsOneWidget);
    expect(find.text("Appointment"), findsOneWidget);
  });
}
