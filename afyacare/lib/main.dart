import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:afyacare/application/medicine/medicine_bloc.dart';
import 'package:afyacare/application/medicine/medicine_event.dart';
import 'package:afyacare/application/profile/bloc/profile_bloc.dart';
import 'package:afyacare/application/record/bloc/record_bloc.dart';
import 'package:afyacare/application/signin_form/signin_form_bloc.dart';
import 'package:afyacare/application/signup_form/bloc/signup_bloc.dart';
import 'package:afyacare/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // final LoginRepo loginRepo;
  MyApp();

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc()..add(AppStarted())),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
        BlocProvider<ProfileBloc>(create: (context)=> ProfileBloc()),
        BlocProvider<MedicineBLoc>(create: (context) => MedicineBLoc()..add(MedicineLoadAllEvent())),
        BlocProvider<RecordBloc>(create: (context)=> RecordBloc())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) => RouterMain(
                authenticationBloc:
                    BlocProvider.of<AuthenticationBloc>(context)),
          )),
    );

  }
}
