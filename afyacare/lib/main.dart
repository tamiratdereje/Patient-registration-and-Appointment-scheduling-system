import 'package:afyacare/presentation/screens/signup2.dart';
import 'package:flutter/material.dart';
import 'presentation/screens/signup.dart';
import 'package:intl/intl.dart';
import './presentation/screens/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      
      home: const Signup()
    );
  }
}
