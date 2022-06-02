import 'dart:html';

import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/brand_name.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:intl/intl.dart';

import '../appointment/appointment_booking.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late bool _passwordVisible;
  late bool _passwordConfirmVisible;
  late bool isButtonVisible;
  late bool isSaveVisible;
  late bool isPasswordEditable;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  bool _isEnable = false;
  TextEditingController genderController = TextEditingController();
  String _selectedGender = 'male';

  @override
  void initState() {
    fullNameController.text = "heloooooooooooooo";
    usernameController.text = "naola";
    isButtonVisible = true;
    isSaveVisible = false;
    isPasswordEditable = false;
    _passwordVisible = true;
    _passwordConfirmVisible = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isButtonVisible = false;
            isSaveVisible = true;
            isPasswordEditable = true;
          });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.edit),
      ),
      body: SafeArea(
        child: Stack(children: [
          const circleClip(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 60, 15, 5),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Profile",
                          style: AfyaTheme.lightTextTheme.headline2,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Icon(Icons.account_circle_outlined)
                      ],
                    ),
                    Text(
                      "Welcome",
                      style: AfyaTheme.lightTextTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
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
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    enabled: _isEnable,
                                    controller: fullNameController,
                                    decoration: const InputDecoration(
                                      labelText: "Full name",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                      controller: usernameController,
                                      enabled: _isEnable,
                                      decoration: const InputDecoration(
                                        labelText: "username",
                                        border: OutlineInputBorder(),
                                      )),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Visibility(
                                    visible: isPasswordEditable,
                                    child: Column(
                                      children: [
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
                                                !value
                                                    .isPasswordEasyWithspace()) {
                                              return "Password should not below 8 character";
                                            } else {
                                              return null;
                                            }
                                          },
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
                                                !value
                                                    .isPasswordEasyWithspace()) {
                                              return "Password should not below 8 character";
                                            } else if (value !=
                                                passwordController.text) {
                                              return "Password not matched!";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  isPasswordEditable
                                      ? const SizedBox(
                                          height: 25,
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ),
                                  TextFormField(
                                    readOnly: true,
                                    controller: fullNameController,
                                    decoration: const InputDecoration(
                                      labelText: "Phone Number",
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    readOnly: true,
                                    controller: fullNameController,
                                    decoration: const InputDecoration(
                                      labelText: "Birth Day",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2 -
                                                  60,
                                            ),
                                            Visibility(
                                              visible: isSaveVisible,
                                              child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        const SnackBar(
                                                            content: Text(
                                                                'Saving user Data')),
                                                      );

                                                      _isEnable = false;
                                                      isButtonVisible = true;
                                                      isSaveVisible = false;
                                                      isPasswordEditable =
                                                          false;
                                                    }
                                                  });
                                                },
                                                child: CustomButton(
                                                  title: "Save",
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          2 -
                                                      60,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {
                                              _isEnable = true;
                                            });
                                          },
                                          child: CustomButton(
                                            title: "Logout",
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                60,
                                            height: 30,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: CustomButton(
                                            title: "Delete",
                                            width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2 -
                                                60,
                                            height: 30,
                                            icon: Icons.delete,
                                            iconVisiblity: true,
                                          ),
                                        ),
                                      ])
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
