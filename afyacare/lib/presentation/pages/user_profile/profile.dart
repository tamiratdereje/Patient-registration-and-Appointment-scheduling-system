import 'package:afyacare/domain/signup/signup_validator.dart';
import 'package:flutter/material.dart';
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
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
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
                                      labelText: "confirm password",
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
                            TextButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Processing Data')),
                                    );
                                  }
                                },
                                child: CustomButton(title: "Change password")),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Want delete sn account? "),
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
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
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
