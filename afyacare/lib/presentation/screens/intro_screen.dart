import 'package:afyacare/presentation/widgets/brand_name.dart';
import 'package:afyacare/presentation/widgets/circle_clip.dart';
import 'package:afyacare/presentation/widgets/custom_button.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const BrandName(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width - 120,
                          child: const Image(image: AssetImage("Intro.png"))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            TextData().introTitle,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(TextData().appointmentDetail),
                          const SizedBox(
                            height: 30,
                          ),
                          TextButton(
                            onPressed: (){},
                            child: const CustomButton(
                                title: "Get Started",
                                icon: Icons.arrow_forward_outlined),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 90,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
