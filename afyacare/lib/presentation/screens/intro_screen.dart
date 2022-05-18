import 'package:afyacare/presentation/widgets/circleClip.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text("AFYA"), Text("CARE")],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Image(image: AssetImage("Intro.png"))),
                    // Container(
                    //     width: MediaQuery.of(context).size.width - 60,
                    //     decoration: const BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage("assets/Intro.png")),
                    //     )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextData().introTitle,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(TextData().details)
                      ],
                    ),
                    
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
