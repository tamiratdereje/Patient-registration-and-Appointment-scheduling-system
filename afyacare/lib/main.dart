import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';

import 'package:afyacare/presentation/pages/appointment/appointed_patient.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const UpcomingSchedule(),
    );
  }
}
