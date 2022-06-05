import 'package:afyacare/application/signup_form/bloc/signup_bloc.dart';
import 'package:afyacare/presentation/pages/Medicine/add_medicine.dart';
import 'package:afyacare/presentation/pages/search/search.dart';
import 'package:afyacare/presentation/pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sign up screen widget test', (WidgetTester tester) async {
    final addValue = find.byKey(const ValueKey("search"));
    
    
   
    final addButton = find.byKey(const ValueKey("button"));
   

  
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(),
        child: Search(),
      ),
    ));
    await tester.enterText(addValue, "Parcetamol");
    // await tester.enterText(addQuantity, "5");
    // await tester.enterText(addDescription, "heal fever");
 
    await tester.tap(addButton);

    expect(find.text("Parcetamol"), findsOneWidget);
    // expect(find.text("5"), findsOneWidget);
    // expect(find.text("heal fever"), findsWidgets);
  });
}
