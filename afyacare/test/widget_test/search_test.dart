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
      home: Scaffold(body: Search()),
      ),
    );
    await tester.tap(addButton);
    await tester.enterText(addValue, "Parcetamol");
 
    

    expect(find.text("Parcetamol"), findsOneWidget);

  });
}
