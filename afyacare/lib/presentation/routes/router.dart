import 'package:afyacare/application/auth/bloc/authentication_bloc.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:afyacare/presentation/pages/intro/intro_screen.dart';
import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:afyacare/presentation/pages/medicine/list_of_medicines.dart';
import 'package:afyacare/presentation/pages/medicine/medicine_detail.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:afyacare/presentation/pages/splash/splash_screen.dart';
import 'package:afyacare/presentation/routes/bottom_nav/patient_screen.dart';
import 'package:afyacare/presentation/routes/bottom_nav/doctor_screen.dart';
import 'package:afyacare/presentation/routes/bottom_nav/pharmasist_screen.dart';
import 'package:afyacare/presentation/routes/path.dart';
import '../pages/appointment/appointment_booking.dart';
import '../pages/appointment/upcoming_schedule.dart';
import '../pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterMain extends StatelessWidget {
  final AuthenticationBloc authenticationBloc;
  SharedPref pref = SharedPref();
  late final GoRouter _router;
  static const String title = 'router';
  String? redirector(state) {
    print("*********************");
    print(state.location);
    print(authenticationBloc.state);

    if (authenticationBloc.state is FirstUse &&
        state.location == Screen().splashScreen &&
        state.location != Screen().intro) {
      return Screen().intro;
    } else if (authenticationBloc.state is BoardingCompleted &&
        state.location != Screen().login &&
        state.location != Screen().signup &&
        state.location != Screen().pharmacistScreen) {
      return Screen().login;
    } else if (authenticationBloc.state is AuthenticationInitial &&
        state.location != Screen().splashScreen &&
        state.location != Screen().login &&
        state.location != Screen().mainscreen &&
        state.location != Screen().doctorscreen &&
        state.location != Screen().pharmacistScreen) {
      return Screen().splashScreen;
    } else if (authenticationBloc.state is AuthenticationNotAuthenticated &&
        state.location != Screen().signup &&
        state.location != Screen().login) {
      return Screen().login;
    } else if (authenticationBloc.state is AuthenticationAuthenticated) {
      if (state.location != Screen().upcomingSchedule &&
          state.location != Screen().mainscreen) {
        return Screen().mainscreen;
      }
    } else if (authenticationBloc.state is AuthenticationAuthenticatedDoct &&
        state.location != Screen().doctorscreen) {
      return Screen().doctorscreen;
    } else if (authenticationBloc.state is AuthenticationAuthenticatedPharm &&
        state.location != Screen().medicineDetail &&
        state.location != Screen().pharmacistScreen) {
      return Screen().pharmacistScreen;
    }

    return null;
  }

  RouterMain({Key? key, required this.authenticationBloc}) : super(key: key) {
    _router = GoRouter(
      refreshListenable: GoRouterRefreshStream(authenticationBloc.stream),
      redirect: (state) => redirector(state),
      initialLocation: Screen().splashScreen,
      routes: <GoRoute>[
        GoRoute(
          path: Screen().pharmacistScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const PharmacistScreen(),
        ),
        GoRoute(
          path: Screen().appointment,
          builder: (BuildContext context, GoRouterState state) =>
              const AppointmentBooking(),
        ),
        GoRoute(
          path: Screen().login,
          builder: (BuildContext context, GoRouterState state) => Login(),
        ),
        GoRoute(
          path: Screen().upcomingSchedule,
          builder: (BuildContext context, GoRouterState state) =>
              const UpcomingSchedule(),
        ),
        GoRoute(
          path: '${Screen().medicineDetail}',
          builder: (BuildContext context, GoRouterState state) {
            final medicineId = int.parse(state.params["id"]!);
            return MedicineDetail(medicineId: medicineId);
          },
        ),
        GoRoute(
          path: Screen().patientDetails,
          builder: (BuildContext context, GoRouterState state) =>
              const PatientDetails(),
        ),
        GoRoute(
          path: Screen().doctorscreen,
          builder: (BuildContext context, GoRouterState state) =>
              const DoctorScreen(),
        ),
        GoRoute(
          path: Screen().pharmacistScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const PharmacistScreen(),
        ),
        GoRoute(
          path: Screen().signup,
          builder: (BuildContext context, GoRouterState state) =>
              const Signup(),
        ),
        GoRoute(
          path: Screen().mainscreen,
          builder: (BuildContext context, GoRouterState state) =>
              const MainScreen(),
        ),
        GoRoute(
          path: Screen().intro,
          builder: (BuildContext context, GoRouterState state) =>
              const IntroScreen(),
        ),
        GoRoute(
          path: Screen().medicineList,
          builder: (BuildContext context, GoRouterState state) =>
              const ListOfMedicine(),
        ),
        GoRoute(
          path: Screen().splashScreen,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        backButtonDispatcher: RootBackButtonDispatcher(),
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      );
}
