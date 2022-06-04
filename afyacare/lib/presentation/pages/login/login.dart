import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:afyacare/application/signin_form/signin_form_bloc.dart';
import 'package:afyacare/domain/auth/authValidator.dart';
import 'package:afyacare/domain/auth/login_user_domain.dart';
import 'package:afyacare/domain/auth/password_domain.dart';
import 'package:afyacare/domain/auth/user_name_domain.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';

import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/brand_name.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation/routes/path.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../../application/signin_form/signin_form_event.dart';
import '../../../application/signin_form/signin_form_state.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  late bool _passwordVisible;
  late bool _passwordConfirmVisible;
  SharedPref pref = SharedPref();
  LoginState();

  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    _passwordVisible = true;
    _passwordConfirmVisible = true;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
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
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: usernameController,
                                    decoration: const InputDecoration(
                                      labelText: "Username",
                                    ),
                                    validator: (value) => authValidator()
                                        .usernameValidater(value),
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
                                    validator: (value) => authValidator()
                                        .passwordValidater(value),
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
                              listener: (context, state) async {
                                if (state is LoginSuccessful) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(108, 25, 221, 31),
                                        content: Text('Login Successful')),
                                  );
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(LoggedIn());
                                  if (await pref.getrole() == 'patient') {
                                    context.go(Screen().mainscreen);
                                  } else if (await pref.getrole() == 'doctor') {
                                    context.go(Screen().doctorscreen);
                                  } else if (await pref.getrole() ==
                                      'pharmacist') {
                                    context.go(Screen().pharmacistScreen);
                                  }
                                } else if (state is LoggingIn) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                } else if (state is LoginFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content:
                                            Text('Login Failed Try again')),
                                  );
                                }
                              },
                              builder: (context, state) {
                                Widget buttonChild = Text("Log in");

                                return TextButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      final LoginDomain loginDomain =
                                          LoginDomain(
                                              username: Username(
                                                  username:
                                                      usernameController.text),
                                              password: Password(
                                                  password:
                                                      passwordController.text));

                                      final loginBloc =
                                          BlocProvider.of<AuthBloc>(context);
                                      loginBloc.add(LoginEvent(loginDomain));

                                      usernameController.clear();
                                      passwordController.clear();
                                    }
                                  },
                                  child: CustomButton(title: "Log in"),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Not register yet ?"),
                                TextButton(
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(
                                          Colors.transparent),
                                    ),
                                    onPressed: () {
                                      context.push(Screen().signup);
                                    },
                                    child: Text("Create Account")),
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
