import 'package:flutter/material.dart';

class ClipPathClass extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: const Offset(180, 0), radius: 250);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}


class ClipPathClass2 extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(center: const Offset(400, 0), radius: 200);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

class circleClip extends StatelessWidget {
  const circleClip({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(left: 15, right: 15),
            // alignment: Alignment.center,
            child: ClipOval(
              clipper: ClipPathClass(),
              child: SizedBox(
                width:MediaQuery.of(context).size.width,
                height:500,
                child: Container(color: Colors.green.withOpacity(0.2)),
              ),
            ),
          ),

           Container(

            child: ClipOval(
              clipper: ClipPathClass2(),
              child: SizedBox(
                width:MediaQuery.of(context).size.width,
                height:250,
                child: Container(color: Colors.green.withOpacity(0.2)),
              ),
            ),
          ),
        ],
      
    ));
  }
}