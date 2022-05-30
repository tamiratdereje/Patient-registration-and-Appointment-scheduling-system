
import 'package:afyacare/presentation/screens/appointment_booking.dart';
<<<<<<< HEAD
import 'package:afyacare/presentation/screens/appointed_patient.dart';


import 'package:flutter/material.dart';
import 'presentation/screens/signup.dart';

=======
import 'package:flutter/material.dart';
>>>>>>> ae1ab097b6cab15e5a4d34f91a96ecf10ae349ae

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const AppointmentBooking()
    );
  }
}