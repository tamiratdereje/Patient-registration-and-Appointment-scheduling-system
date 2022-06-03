import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('Sign in authentication', (WidgetTester tester) async {
    final addUserName = find.byKey(const ValueKey("enterusername"));
    final addPassword = find.byKey(const ValueKey("enterpassword"));
    final signButton = find.byKey(const ValueKey("login"));

    await tester.pumpWidget(MaterialApp(home: Login()));
    await tester.enterText(addUserName, "libanabduba");
    await tester.enterText(addPassword, "liban@123");
    await tester.tap(signButton);

    expect(find.text("libanabduba"), findsOneWidget);
    expect(find.text("liban@123"), findsOneWidget);
  });
}
