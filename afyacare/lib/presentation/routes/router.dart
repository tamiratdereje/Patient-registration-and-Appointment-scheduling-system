import 'package:afyacare/presentation/pages/appointment/upcoming_schedule.dart';
import 'package:afyacare/presentation/pages/intro/intro_screen.dart';
import 'package:afyacare/presentation/pages/login/login.dart';
import 'package:afyacare/presentation/pages/medicine/list_of_medicines.dart';
import 'package:afyacare/presentation/pages/medicine/medicine_detail.dart';
import 'package:afyacare/presentation/pages/record/pateint_details.dart';
import 'package:afyacare/presentation/pages/medicine/list_of_medicines.dart';
import 'package:afyacare/presentation/pages/splash/splash_screen.dart';
import 'package:afyacare/presentation/routes/bottom_nav/patient_screen.dart';
import 'package:afyacare/presentation/routes/bottom_nav/doctor_screen.dart';
import 'package:afyacare/presentation/routes/bottom_nav/pharmasist_screen.dart';
import '../pages/appointment/appointment_booking.dart';
import '../pages/appointment/upcoming_schedule.dart';
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
        backButtonDispatcher: RootBackButtonDispatcher(),
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
        builder: (BuildContext context, GoRouterState state) =>
            const AppointmentBooking(),
      ),
      GoRoute(
        path: '/appointment',
        builder: (BuildContext context, GoRouterState state) =>
            const AppointmentBooking(),
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) => const Login(),
      ),
      GoRoute(
        path: '/upcomingSchedule',
        builder: (BuildContext context, GoRouterState state) =>
            const UpcomingSchedule(),
      ),
      GoRoute(
        path: '/medicineDetail/:id',
        builder: (BuildContext context, GoRouterState state) {
          final medicineId = int.parse(state.params["id"]!);
          return MedicineDetail(medicineId);
        },
      ),
      GoRoute(
        path: '/patientDetails',
        builder: (BuildContext context, GoRouterState state) =>
            const PatientDetails(),
      ),
      GoRoute(
        path: '/doctorscreen',
        builder: (BuildContext context, GoRouterState state) =>
            const DoctorScreen(),
      ),
      GoRoute(
        path: '/pharmacistScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const PharmacistScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (BuildContext context, GoRouterState state) => const Signup(),
      ),
      GoRoute(
        path: '/appointment',
        builder: (BuildContext context, GoRouterState state) =>
            const AppointmentBooking(),
      ),
      GoRoute(
        path: '/mainscreen',
        builder: (BuildContext context, GoRouterState state) =>
            const MainScreen(),
      ),
      GoRoute(
        path: '/medicineList',
        builder: (BuildContext context, GoRouterState state) =>
            const ListOfMedicine(),
      ),
    ],
  );
}
