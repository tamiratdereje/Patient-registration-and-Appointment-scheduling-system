// ignore_for_file: unnecessary_import

import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regexpattern/regexpattern.dart';

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
  late bool isPasswordchangeVisible;
  late bool isFloatVisible;

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
    fullNameController.text = "hello";
    usernameController.text = "naola";
    isButtonVisible = true;
    isSaveVisible = false;
    isPasswordchangeVisible = false;
    isPasswordEditable = false;
    _passwordVisible = true;
    _passwordConfirmVisible = true;
    isFloatVisible = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: isFloatVisible,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              isButtonVisible = false;
              isSaveVisible = true;
              isPasswordchangeVisible = true;
              _isEnable = true;
              isFloatVisible = false;
            });
          },
          backgroundColor: Colors.green,
          child: const Icon(Icons.edit),
        ),
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
                      "User Id",
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
                                    enabled: false,
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
                                  isPasswordchangeVisible
                                      ? Column(
                                          children: [
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                    child: const Text(
                                                      'Edit Password',
                                                      style: TextStyle(
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    onTap: () => {
                                                          setState(() {
                                                            isPasswordEditable =
                                                                true;
                                                          })
                                                        }),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        ),
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
                                            labelText: "Enter new password",
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
                                            labelText: "confirm new password",
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
                                      border: OutlineInputBorder(),
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
                                              MainAxisAlignment.end,
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
                                                      isPasswordchangeVisible =
                                                          false;
                                                      isButtonVisible = true;
                                                      isSaveVisible = false;
                                                      isPasswordEditable =
                                                          false;
                                                      isFloatVisible = true;
                                                    }
                                                  });
                                                },
                                                child: CustomButton(
                                                  title: "Save",
                                                  width: MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          3 -
                                                      60,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: isButtonVisible,
                                          child: Row(
                                            children: [
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
                                            ],
                                          ),
                                        )
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
