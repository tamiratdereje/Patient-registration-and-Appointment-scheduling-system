import 'package:afyacare/presentation/pages/Error/error.dart';
import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:afyacare/presentation/pages/signup/signup.dart';
import 'package:afyacare/presentation/routes/router.dart' as AfyaRouter;
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return NoResultFoundScreen();
//   }
// }

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoResultFoundScreen(),
    );
  }
}
