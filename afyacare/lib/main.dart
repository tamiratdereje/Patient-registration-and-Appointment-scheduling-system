import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:afyacare/presentation/pages/intro/intro_screen.dart';
import 'package:afyacare/presentation/routes/router.dart' as AfyaRouter;
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc()..add(AppStarted());
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // final LoginRepo loginRepo;
  MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is FirstUse) {
              return IntroScreen();
            }
            return UpcomingSchedule();
          },
        ));
  }
}
