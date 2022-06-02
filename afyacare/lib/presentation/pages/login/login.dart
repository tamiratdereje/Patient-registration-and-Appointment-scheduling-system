import 'package:afyacare/application/signin_form/signin_form_bloc.dart';
import 'package:afyacare/domain/auth/login_user_domain.dart';

import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/brand_name.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import 'package:regexpattern/regexpattern.dart';
import 'package:intl/intl.dart';
import 'package:afyacare/infrastructure/auth/login_repository.dart';
import 'package:afyacare/infrastructure/auth/login_model.dart';

import '../../../application/signin_form/signin_form_event.dart';
import '../../../application/signin_form/signin_form_state.dart';
import '../../../infrastructure/auth/login_data_provider.dart';

import '../appointment/appointment_booking.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  late bool passwordVisible;

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    passwordVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          "Login Account",
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
                    const BrandName(),
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
                                    key: const Key('enterusername'),
                                    controller: usernameController,
                                    decoration: const InputDecoration(
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
                                    obscureText: passwordVisible,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
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
                            TextButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                  // context.go('/mainscreen');
                                  // context.go('/doctorscreen');
                                  context.go('/pharmacistScreen');
                                }
                              },
                              // builder: (context, state) {
                              //   Widget buttonChild = const Text("Log in");

                              //   if (state is LoggingIn) {
                              //     buttonChild = const SizedBox(
                              //       height: 10,
                              //       width: 10,
                              //       child: const CircularProgressIndicator(
                              //         color: Colors.white,
                              //       ),
                              //     );
                              //   }

                              //   if (state is LoginSuccessful) {
                              //     buttonChild = const Text("Login successful");
                              //   }

                              //   if (state is LoginFailed) {
                              //     buttonChild = const Text("Login Failed");
                              //   }

                              //   TextButton(
                              //     onPressed: () async {
                              //       final LoginDomain loginDomain = LoginDomain(
                              //           email: usernameController.text,
                              //           password: passwordController.text);

                              //       final loginBloc =
                              //           BlocProvider.of<AuthBloc>(context);
                              //       loginBloc.add(LoginEvent(loginDomain));

                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //             content: Text('Processing Data')),
                              //       );
                              //       usernameController.clear();
                              //       passwordController.clear();
                              //     },
                              //     child: const CustomButton(title: "Sign in"),
                              //   );
                              // },
                              child: SizedBox(
                                height: 0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Not register yet ?"),
                                TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    onPressed: () {
                                      context.go('/signup');
                                    },
                                    child: const Text(" Create Account")),
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
