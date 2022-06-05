import 'package:afyacare/presentation/pages/Medicine/add_medicine.dart';
import 'package:afyacare/presentation/pages/appointment/appointment_booking.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Patient Details screen widget test',
      (WidgetTester tester) async {
    final addMedicine = find.byKey(const ValueKey("medicine"));
    final addDescription = find.byKey(const ValueKey("description"));
    final addButton = find.byKey(const ValueKey("add"));
    final saveButton = find.byKey(const ValueKey("button"));

   
   
    await tester.pumpWidget(const MaterialApp(home: PatientDetails()));
    await tester.tap(addButton);
    await tester.enterText(addMedicine, "Parcetamol");
    await tester.enterText(addDescription, "kill germ");

    await tester.tap(saveButton);


    expect(find.text("Parcetamol"), findsOneWidget);
    expect(find.text("kill germ"), findsOneWidget);
  });
}
