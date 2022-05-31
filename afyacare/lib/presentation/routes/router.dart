import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:afyacare/presentation/pages/intro/intro_screen.dart';
import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';

import '../pages/appointment/appointment_booking.dart';
import '../pages/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Router extends StatelessWidget {
  Router({Key? key}) : super(key: key);
  static const String title = 'router';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: title,
        theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      );

  final GoRouter _router = GoRouter(
    // initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const IntroScreen(),
      ),
      GoRoute(
        path: '/appointment',
        builder: (BuildContext context, GoRouterState state) =>
            const AppointmentBooking(),
      ),
       GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) =>
            const Login(),
      ),
       GoRoute(
        path: '/upcomingSchedule',
        builder: (BuildContext context, GoRouterState state) =>
            const UpcomingSchedule(),
      ),
       GoRoute(
        path: '/patientDetails',
        builder: (BuildContext context, GoRouterState state) =>
            const PatientDetails(),
      ),
       GoRoute(
        path: '/appointment',
        builder: (BuildContext context, GoRouterState state) =>
            const AppointmentBooking(),
      ),
    ],
  );
}
