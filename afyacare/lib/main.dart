import 'package:afyacare/presentation/screens/appointment_booking.dart';

import 'package:afyacare/presentation/screens/appointed_patient.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/signup.dart';
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
        home: const PatientDetails());
=======

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AppointmentBooking()
    );
>>>>>>> 5f7c83ec757460d843611079db038c1e4fa60776
  }
}