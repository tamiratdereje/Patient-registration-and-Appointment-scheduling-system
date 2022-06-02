import 'package:afyacare/presentation/pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sign in authentication', (WidgetTester tester) async {
    final addFullName = find.byKey(const ValueKey("fullname"));
    final addDate = find.byKey(const ValueKey("date"));
    final addMale = find.byKey(const ValueKey('male'));
    final addFemale = find.byKey(const ValueKey('female'));
    final createUsername = find.byKey(const ValueKey("createusername"));
    final createPassword = find.byKey(const ValueKey("createpassword"));
    final confirmPassword = find.byKey(const ValueKey("confirmpassword"));
    final signButton = find.byKey(const ValueKey("signup"));

    await tester.pumpWidget(const MaterialApp(home: Signup()));
    await tester.enterText(addFullName, "Liban Abduba");
    await tester.enterText(createUsername, "liban@123");
    await tester.enterText(createPassword, "libanabduba");
    await tester.enterText(confirmPassword, "libanabduba");
    await tester.tap(signButton);

    expect(find.text("Liban Abduba"), findsOneWidget);
    expect(addDate, findsOneWidget);
    expect(addFemale, findsOneWidget);
    expect(addMale, findsOneWidget);
    expect(find.text("liban@123"), findsOneWidget);
    expect(find.text("libanabduba"), findsWidgets);
  });
}
