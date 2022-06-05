import 'package:afyacare/application/signup_form/bloc/signup_bloc.dart';
import 'package:afyacare/domain/signup/confirm_password_validator.dart';
import 'package:afyacare/domain/signup/date_of_birth_domain.dart';
import 'package:afyacare/domain/signup/fullname_domain.dart';
import 'package:afyacare/domain/signup/password_domain.dart';
import 'package:afyacare/domain/signup/signup_user_domain.dart';
import 'package:afyacare/domain/signup/signup_validator.dart';
import 'package:afyacare/domain/signup/username_domain.dart';
import 'package:afyacare/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/afya_theme.dart';

import '../../core/widgets/brand_name.dart';
import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';

class AdminAdd extends StatefulWidget {
  const AdminAdd({Key? key}) : super(key: key);

  @override
  State<AdminAdd> createState() => _SignupState();
}

class _SignupState extends State<AdminAdd> {
  late bool _passwordVisible;
  late bool _passwordConfirmVisible;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  late String formattedDate;
  String _chosenValue = 'Doctor';
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
    passwordConfirmController.dispose();
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
                      "Register user",
                      style: AfyaTheme.lightTextTheme.headline2,
                    ),
                    Text(
                      "Welcome",
                      style: AfyaTheme.lightTextTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // BrandName(),
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
                                      key: Key("fullname"),
                                      controller: fullNameController,
                                      decoration: const InputDecoration(
                                        labelText: "Enter full name",
                                      ),
                                      validator: (value) => SignupValidator()
                                          .fullNameValidater(value)),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    key: Key("date"),
                                    controller:
                                        dateinput, //editing controller of this TextField

                                    decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons
                                            .calendar_today), //icon of text field
                                        labelText:
                                            "Enter Date" //label text of field
                                        ),

                                    readOnly: true,
                                    onTap: () async {
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(
                                                  1930), //DateTime.now() - not to allow to choose before today.
                                              lastDate: DateTime.now());

                                      if (pickedDate != null) {
                                        formattedDate = pickedDate
                                            .toString()
                                            .substring(0, 10);
                                        setState(() {
                                          dateinput.text =
                                              formattedDate; //set output date to TextField value.
                                        });
                                      }
                                    },
                                    validator: (value) {
                                      SignupValidator()
                                          .dateOfBirthValidator(value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),

                                  // const SizedBox(height: 25),
                                  TextFormField(
                                    key: Key("username"),
                                    controller: usernameController,
                                    decoration: const InputDecoration(
                                      labelText: "Create username",
                                    ),
                                    validator: (value) => SignupValidator()
                                        .usernameValidater(value),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    key: Key("password"),
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
                                    validator: (value) => SignupValidator()
                                        .passwordValidater(value),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    key: Key("confirmpassword"),
                                    controller: passwordConfirmController,
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
                                    validator: (value) => SignupValidator()
                                        .confrimPasswordValidator(
                                            value, passwordController.text),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            DropdownButton<String>(
                              key: Key("drop"),
                              focusColor: Colors.white,
                              value: _chosenValue,
                              //elevation: 5,
                              style: TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.black,
                              items: <String>[
                                'Doctor',
                              
                                'Pharmacist',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                "Please choose a role.   Please choose a role",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  _chosenValue = value!;
                                });
                              },
                            ),
                            BlocConsumer<SignupBloc, SignupState>(
                                listener: (context, state) {
                              if (state is SignupSuccessful) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(108, 25, 221, 31),
                                      content: Text('AdminAdd Successful')),
                                );
                                context.go(Screen().login);
                              } else if (state is SignupLoading) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
                                );
                              } else if (state is SignupFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content:
                                          Text('AdminAdd Failed Try again')),
                                );
                              }
                            }, builder: (context, state) {
                              return TextButton(
                                key: Key("button"),
                                  onPressed: () {
                                    String brday = birthdayController.text;
                                    if (_formKey.currentState!.validate()) {
                                      final blocProv =
                                          BlocProvider.of<SignupBloc>(context);
                                      final SignupDomain signupDomain =
                                          SignupDomain(
                                              username: Username(
                                                  username:
                                                      usernameController.text),
                                              fullName: FullName(
                                                  fullName:
                                                      fullNameController.text),
                                              dateOfBirth: DateOfBirth(
                                                  dateOfBirth: formattedDate),
                                              password: Password(
                                                  password:
                                                      passwordController.text),
                                              confirmPassword: Password(
                                                  password:
                                                      passwordConfirmController
                                                          .text));
                                      blocProv.add(SignUpEvent(signupDomain));
                                    }
                                  },
                                  child: CustomButton(title: "Add"));
                            }),
                         
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
