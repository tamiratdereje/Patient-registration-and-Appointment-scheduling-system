import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Appointement Screen test', (WidgetTester tester) async {
    
    // final rescheduleButton = find.byKey(ValueKey("reschedule"));
    // final cancelButton = find.byKey(ValueKey("cancel"));

    await tester.pumpWidget(const MaterialApp(home: UpcomingSchedule()));
    // await tester.tap(rescheduleButton);
    // await tester.tap(cancelButton);
     
    expect(find.text("Reschedule"), findsWidgets);
    expect(find.text("Cancel"), findsWidgets);
    
  });
}
