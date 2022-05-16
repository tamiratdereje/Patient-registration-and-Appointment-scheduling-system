import 'package:flutter/material.dart';
import "../widgets/circleClip.dart";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          circleClip(),
          Center(
            child: Text("home page"),
          )
        ],
      ),
    );
  }
}
