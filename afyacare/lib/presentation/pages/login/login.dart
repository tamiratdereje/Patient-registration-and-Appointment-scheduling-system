import 'package:afyacare/application/signin_form/signin_form_bloc.dart';
import 'package:afyacare/domain/auth/login_user_domain.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/brand_name.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:intl/intl.dart';
import 'package:afyacare/infrastructure/auth/login_repository.dart';
import 'package:afyacare/infrastructure/auth/login_model.dart';

import '../../../application/signin_form/signin_form_event.dart';
import '../../../application/signin_form/signin_form_state.dart';
import '../../../infrastructure/auth/login_data_provider.dart';



class LoginState extends StatelessWidget {
  // late bool _passwordVisible;
  // late bool _passwordConfirmVisible;
  // final LoginRepo loginRepo;
  LoginState();

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  TextEditingController genderController = TextEditingController();
  String _selectedGender = 'male';

  // @override
  // void initState() {
  //   _passwordVisible = true;
  //   _passwordConfirmVisible = true;
  //   dateinput.text = "";
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    usernameController.dispose();
    passwordController.dispose();
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
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                      labelText: "username",
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty || !value.isEmail()) {
                                        return "Enter correct username, Eg. tam34@gmail.com";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: InputDecoration(
                                      // suffixIcon: IconButton(
                                      //   onPressed: () {
                                      //     // setState(() {
                                      //     //   _passwordVisible =
                                      //    /**    !_passwordVisible;*/
                                      //     // });
                                      //   },
                                      //   icon: Icon(_passwordVisible
                                      //       ? Icons.visibility
                                      //       : Icons.visibility_off),
                                      // ),
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

                            BlocConsumer<AuthBloc, AuthState>(
                              listener: (context, state) {
                                Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PatientDetails(),
                                ),
                              ); 
                              },

                              builder: (context, state) {
                                  Widget buttonChild = Text("Log in");

                                  if (state is LoggingIn) {
                                    buttonChild = SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    );
                                  }

                                  if (state is LoginSuccessful) {
                                    buttonChild = Text("Login successful");
                                  }

                                  if (state is LoginFailed) {
                                    buttonChild = Text("Login Failed");
                                  }

                                return TextButton(
                                  onPressed: () async {
                                    final LoginDomain loginDomain = LoginDomain(
                                        email: usernameController.text,
                                        password: passwordController.text);

                                    final loginBloc =
                                        BlocProvider.of<AuthBloc>(context);
                                    loginBloc.add(LoginEvent(loginDomain));

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                    usernameController.clear();
                                    passwordController.clear();
                                  },
                                  child: CustomButton(title: "Sign in"),
                                );
                              },
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
