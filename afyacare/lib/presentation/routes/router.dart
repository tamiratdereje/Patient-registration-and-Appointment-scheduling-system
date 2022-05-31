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
      );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const Signup(),
      ),
      GoRoute(
        path: '/appointment',
        builder: (BuildContext context, GoRouterState state) =>
            const AppointmentBooking(),
      ),
    ],
  );
}
