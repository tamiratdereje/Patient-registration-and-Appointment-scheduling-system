import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';
import '../../core/afya_theme.dart';
// import 'package:intl/intl.dart';

import '../../core/widgets/brand_name.dart';
import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late bool _passwordVisible;
  late bool _passwordConfirmVisible;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    _passwordVisible = true;
    _passwordConfirmVisible = true;
    dateController.text = "";
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
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
                    Text(
                      "Signup",
                      style: AfyaTheme.lightTextTheme.headline2,
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
                                    controller: fullNameController,
                                    decoration: InputDecoration(
                                      labelText: "Enter full name",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[a-zA-Z ]+$')
                                              .hasMatch(value)) {
                                        return "Enter correct name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                
                                  TextField(
                                    controller: dateController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        suffixIcon: Icon(Icons
                                            .calendar_today), //icon of text field
                                        labelText: "Enter Date"),
                                    onTap: () async {
                                      final selectedDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(1930),
                                        lastDate: DateTime.now(),
                                        initialDate: DateTime.now(),
                                        selectableDayPredicate: (day) =>
                                            day.isBefore(DateTime.now()),
                                      );
                                      String dateString = selectedDate
                                          .toString()
                                          .substring(0, 10);

                                      if (selectedDate != null) {
                                        setState(() {
                                          dateController.text =
                                              dateString;
                                        });
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),

                                  // const SizedBox(height: 25),
                                  TextFormField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      labelText: "Create username",
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
                                  TextFormField(
                                    obscureText: _passwordConfirmVisible,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _passwordConfirmVisible =
                                                !_passwordConfirmVisible;
                                          });
                                        },
                                        icon: Icon(_passwordConfirmVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      // suffixIcon: Icon(Icons.scuba_diving),
                                      labelText: "confirm password",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.isPasswordEasyWithspace()) {
                                        return "Password should not below 8 character";
                                      } else if (value !=
                                          passwordController.text) {
                                        return "Password not matched!";
                                      } else {
                                        return null;
                                      }
                                    },
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
                                  }
                                },
                                child: CustomButton(title: "Sign up")),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Have an account? "),
                                TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    onPressed: () {
                                      context.go('/login');
                                    },
                                    child: Text(" Login")),
                              ],
                            )
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
