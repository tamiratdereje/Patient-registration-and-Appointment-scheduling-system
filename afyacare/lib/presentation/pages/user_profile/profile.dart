import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:afyacare/application/medicine/medicine_bloc.dart';
import 'package:afyacare/application/medicine/medicine_state.dart';
import 'package:afyacare/application/profile/bloc/profile_bloc.dart';
import 'package:afyacare/domain/auth/password_domain.dart';
import 'package:afyacare/domain/profile/profile_domain.dart';
import 'package:afyacare/domain/signup/signup_validator.dart';
import 'package:afyacare/infrastructure/profile/profile_model.dart';
import 'package:afyacare/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/afya_theme.dart';

import '../../core/widgets/brand_name.dart';
import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  late bool _newPasswordVisible;
  late bool _oldPasswordVisible;
  late bool _passwordConfirmVisible;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    _newPasswordVisible = true;
    _passwordConfirmVisible = true;
    _oldPasswordVisible = true;

    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _confirmPasswordController.dispose();
    _newPasswordController.dispose();
    _oldPasswordController.dispose();
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
                        Column(
                          children: [
                            Text(
                              "Profile",
                              style: AfyaTheme.lightTextTheme.headline2,
                            ),
                            Text(
                              "user",
                              style: AfyaTheme.lightTextTheme.bodyText1,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(child: Container()),
                        TextButton.icon(
                          key: Key("logout"),
                          icon: Icon(Icons.logout, color: Colors.black),
                          label: Text(
                            "Logout",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Logout'),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      BlocProvider.of<ProfileBloc>(context)
                                          .add(Logout());

                                      return Navigator.pop(context, 'Cancel');
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "change Password",
                      style: AfyaTheme.lightTextTheme.headline2,
                    ),
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
                                    key: Key("oldpassword"),
                                    obscureText: _oldPasswordVisible,
                                    controller: _oldPasswordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _oldPasswordVisible =
                                                !_oldPasswordVisible;
                                          });
                                        },
                                        icon: Icon(_oldPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      // suffixIcon: Icon(Icons.scuba_diving),
                                      labelText: "Enter old password",
                                    ),
                                    validator: (value) => SignupValidator()
                                        .passwordValidater(value),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    key: Key("newpassword"),
                                    obscureText: _newPasswordVisible,
                                    controller: _newPasswordController,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _newPasswordVisible =
                                                !_newPasswordVisible;
                                          });
                                        },
                                        icon: Icon(_newPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                      ),
                                      // suffixIcon: Icon(Icons.scuba_diving),
                                      labelText: "Enter new password",
                                    ),
                                    validator: (value) => SignupValidator()
                                        .passwordValidater(value),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  TextFormField(
                                    key: Key("confirmpassword"),
                                    controller: _confirmPasswordController,
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
                                      labelText: "Confirm password",
                                    ),
                                    validator: (value) => SignupValidator()
                                        .confrimPasswordValidator(value,
                                            _confirmPasswordController.text),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                ],
                              ),
                            ),
                            BlocConsumer<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                              return (TextButton(
                                key: Key("button"),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ProfileDomain profileDomain =
                                          ProfileDomain(
                                              old_password: Password(
                                                  password:
                                                      _oldPasswordController
                                                          .text),
                                              new_password: Password(
                                                  password:
                                                      _newPasswordController
                                                          .text));

                                      BlocProvider.of<ProfileBloc>(context).add(
                                          EditPassword(
                                              profileDomain: profileDomain));
                                      _oldPasswordController.clear();
                                      _newPasswordController.clear();
                                      _confirmPasswordController.clear();
                                    }
                                  },
                                  child:
                                      CustomButton(title: "Change password")));
                            }, listener: (context, state) async {
                              print(state);
                              if (state is ProfileChanged) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(108, 25, 221, 31),
                                      content:
                                          Text('Profile Successfully Edited')),
                                );
                              }
                              if (state is LoggedOut) {
                                print(
                                    "loggout _____________________________________");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(108, 25, 221, 31),
                                      content: Text(' Successfully Loggedout')),
                                );
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(UserLoggedout());

                                context.go(Screen().login);
                              }
                              if (state is AccountDeleted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor:
                                          Color.fromARGB(108, 25, 221, 31),
                                      content:
                                          Text('Account Deleted Successfully')),
                                );
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(UserLoggedout());

                                context.go(Screen().login);
                              } else if (state is LoggingOut ||
                                  state is ChangingProfile ||
                                  state is DeletingAccount) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Loading.....')),
                                );
                              } else if (state is LoggoutFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text('Logout Failed Try again')),
                                );
                              } else if (state is DeletingAccoutnFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text('Delete Account Failed')),
                                );
                              } else if (state is ProfileChangeFailed) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Text('Changing Profile Failed')),
                                );
                              }
                            }),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Want delete an account? "),
                                TextButton(
                                  onPressed: () {
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Delete account'),
                                        content: const Text(
                                            'Are you sure you want to delete account?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              BlocProvider.of<ProfileBloc>(
                                                      context)
                                                  .add(DeleteAccount());
                                              return Navigator.pop(
                                                  context, 'Cancel');
                                            },
                                            child: const Text(
                                              'Delete',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Delete account",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
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
