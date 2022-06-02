import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/brand_name.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:intl/intl.dart';

import '../appointment/appointment_booking.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _passwordVisible;
  late bool _passwordConfirmVisible;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  TextEditingController genderController = TextEditingController();
  String _selectedGender = 'male';

  @override
  void initState() {
    _passwordVisible = true;
    _passwordConfirmVisible = true;
    dateinput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    usernameController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    birthdayController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          circleClip(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 60, 15, 5),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Login Account",
                          style: AfyaTheme.lightTextTheme.headline2,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Icon(Icons.account_circle_outlined)
                      ],
                    ),

                    Text(
                      "Welcome",
                      style: AfyaTheme.lightTextTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    BrandName(),
                    // Form(child: child)
                    Form(
                      key: _formKey,
                      child: Container(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: Key('enterusername'),
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      labelText: "username",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.isUsername()) {
                                        return "Enter correct username, Eg. Jeb_deju";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    key: Key('enterpassword'),
                                    obscureText: _passwordVisible,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                        icon: Icon(_passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      // suffixIcon: Icon(Icons.scuba_diving),
                                      labelText: "Enter password",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.isPasswordEasyWithspace()) {
                                        return "Password should not below 8 character";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  context.go('/upcomingSchedule');
                                }
                              },
                              child: CustomButton(key:Key("login"),title: "Login"),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
