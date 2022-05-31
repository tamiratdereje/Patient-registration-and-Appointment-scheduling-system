<<<<<<< HEAD
import 'package:afyacare/presentation/screens/appointment_booking.dart';

import 'package:afyacare/presentation/screens/appointed_patient.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/signup.dart';
=======
import 'package:afyacare/presentation/pages/record/pateint_details.dart';

import 'package:afyacare/presentation/pages/appointment/appointed_patient.dart';
>>>>>>> fe114555a15db8cd8e7f9d283911b04f4360bbb0
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const Signup(),
    );

=======
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const PatientDetails(),
    );
>>>>>>> fe114555a15db8cd8e7f9d283911b04f4360bbb0
  }
}
