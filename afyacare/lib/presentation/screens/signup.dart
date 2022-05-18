import 'package:afyacare/presentation/widgets/circle_clip.dart';
import 'package:flutter/material.dart';
import '../common/afya_theme.dart';
import '../widgets/brand_name.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          circleClip(),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 60, 15, 5),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Signup",
                      style: AfyaTheme.lightTextTheme.headline2,
                    ),
                    Text(
                      "Welcome",
                      style: AfyaTheme.lightTextTheme.bodyText1,
                    ),
                    SizedBox(height: 50,),
                    BrandName(),
                    // Form(child: child)
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
