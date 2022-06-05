import 'package:afyacare/application/profile/bloc/profile_bloc.dart';
import 'package:afyacare/application/signin_form/signin_form_bloc.dart';
import 'package:afyacare/application/signup_form/bloc/signup_bloc.dart';
import 'package:afyacare/presentation/pages/Medicine/add_medicine.dart';
import 'package:afyacare/presentation/pages/signup/signup.dart';
import 'package:afyacare/presentation/pages/user_profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sign up screen widget test', (WidgetTester tester) async {
    final oldPass = find.byKey(const ValueKey("oldpassword"));
    final newPass = find.byKey(const ValueKey("newpasssword"));
    final confirmpass = find.byKey(const ValueKey("confirmpassword"));

    final button = find.byKey(const ValueKey("button"));
    final logout = find.byKey(const ValueKey("logout"));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(),
        child:  UserProfile(),
      ),
    ));
    await tester.tap(logout);
    await tester.enterText(oldPass, "Parcetamol");
    await tester.enterText(newPass, "healfever");
    await tester.enterText(confirmpass, "healfever");

    await tester.tap(button);
   

    expect(find.text("Parcetamol"), findsOneWidget);
    expect(find.text("healfever"), findsWidgets);
  });
}
