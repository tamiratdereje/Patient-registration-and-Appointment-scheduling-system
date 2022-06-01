import 'package:afyacare/infrastructure/auth/login_repository.dart';
import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';

import 'package:afyacare/presentation/pages/appointment/appointed_patient.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/auth/signin_form/signin_form_bloc.dart';
import 'infrastructure/auth/login_data_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final LoginRepo loginRepo;
  const MyApp();

  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: LoginState(),
      ),
    );
  }
}
