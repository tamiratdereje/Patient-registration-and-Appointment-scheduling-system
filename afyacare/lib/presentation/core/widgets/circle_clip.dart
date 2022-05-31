import 'package:flutter/material.dart';

class ClipPathClass extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: const Offset(180, -40), radius: 240);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class ClipPathClass2 extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: const Offset(400, -40), radius: 200);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class circleClip extends StatelessWidget {
  const circleClip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Container(
          child: ClipOval(
            clipper: ClipPathClass(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Container(color: Colors.green.withOpacity(0.2)),
            ),
          ),
        ),
        Container(
          child: ClipOval(
            clipper: ClipPathClass2(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Container(color: Colors.green.withOpacity(0.2)),
            ),
          ),
        ),
      ],
    ));
  }
}
