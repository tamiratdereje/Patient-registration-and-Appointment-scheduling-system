import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:afyacare/application/signin_form/signin_form_bloc.dart';
import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('Sign in authentication', (WidgetTester tester) async {
    final addUserName = find.byKey(const ValueKey("username"));
    final addPassword = find.byKey(const ValueKey("password"));
    final form = find.byType(TextFormField);
    final signButton = find.byKey(const ValueKey("login"));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: Login(),
      ),
    ));
    await tester.tap(signButton);
    await tester.pump();
    await tester.enterText(addUserName, "libanabduba");
    await tester.enterText(addPassword, "liban@123");
    
    expect(form, findsWidgets);
    expect(find.textContaining("libanabduba"), findsOneWidget);
    expect(find.textContaining("liban@123"), findsOneWidget);
  });
}
