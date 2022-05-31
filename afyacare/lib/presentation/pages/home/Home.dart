import 'package:flutter/material.dart';
import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          circleClip(),
          Column(
            children: [
              Container(
                child: TextButton(onPressed: () {}, child:
                CustomButton(title: "Get started",icon:Icons.arrow_forward_rounded) ),
              )
            ],
          )
        ],
      ),
    );
  }
}


