// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final IconData? icon;
  const CustomButton({Key? key, required this.title, this.width, this.height=35, this.icon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthFull = double.infinity;
    return Container(
        width: width ?? widthFull,
        height: width == null ? 50 : height,
        // margin: EdgeInsets.all(8),
        // padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.green,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  title,       
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  ),
                ),
              ),
            ),
            Expanded(flex:2,child: Icon(icon,color: Colors.white,size: 26))
          ],
        ));
  }
}
