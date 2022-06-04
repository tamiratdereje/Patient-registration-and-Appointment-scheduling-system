import 'package:afyacare/presentation/pages/Medicine/add_medicine.dart';
import 'package:afyacare/presentation/pages/appointment/appointment_booking.dart';
import 'package:afyacare/presentation/pages/intro/intro_screen.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Patient Details screen widget test',
      (WidgetTester tester) async {
    final startButton = find.byKey(const ValueKey("button"));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(),
        child: IntroScreen(),
      ),
    ));

    await tester.tap(startButton);

  });
}
