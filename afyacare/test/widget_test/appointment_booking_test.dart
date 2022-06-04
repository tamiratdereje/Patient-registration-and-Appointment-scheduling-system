import 'package:afyacare/presentation/pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sign up screen widget test', (WidgetTester tester) async {
    final addFullName = find.byKey(const ValueKey("fullname"));
    final addDate = find.byKey(const ValueKey("date"));
    final createUsername = find.byKey(const ValueKey("username"));
    final createPassword = find.byKey(const ValueKey("password"));
    final confirmPassword = find.byKey(const ValueKey("confirmpassword"));
    final signupButton = find.byKey(const ValueKey("signup"));
    final signButton = find.byKey(const ValueKey("signin"));

    await tester.pumpWidget(const MaterialApp(home: Signup()));
    await tester.enterText(addFullName, "Liban Abduba");
    await tester.enterText(createUsername, "liban@123");
    await tester.enterText(createPassword, "libanabduba");
    await tester.enterText(confirmPassword, "libanabduba");
    await tester.tap(signupButton);
    await tester.tap(signButton);

    expect(find.text("Liban Abduba"), findsOneWidget);
    expect(addDate, findsOneWidget);
    expect(find.text("liban@123"), findsOneWidget);
    expect(find.text("libanabduba"), findsWidgets);
  });
}
