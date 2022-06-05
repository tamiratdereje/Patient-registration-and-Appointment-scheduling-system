import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Appointement Screen test', (WidgetTester tester) async {
    
    final button = find.byType(TextButton);
    
    await tester.pumpWidget(const MaterialApp(home: UpcomingSchedule()));
    
     
    expect(button, findsWidgets);
   
    
  });
}
