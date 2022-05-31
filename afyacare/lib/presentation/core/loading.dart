import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [Center(child: CircularProgressIndicator())],
          )
        ],
      ),
    );
  }
}
