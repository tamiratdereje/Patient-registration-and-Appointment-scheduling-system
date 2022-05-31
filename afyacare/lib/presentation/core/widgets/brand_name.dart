import 'package:flutter/material.dart';
import '../afya_theme.dart';

class BrandName extends StatelessWidget {
  const BrandName({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "AFYA ",
          style: AfyaTheme.lightTextTheme.headline1!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        Text(
          "CARE",
          style: AfyaTheme.lightTextTheme.headline1!
              .copyWith(color: Colors.green, fontWeight: FontWeight.w200),
        )
      ],
    );
  }
}
