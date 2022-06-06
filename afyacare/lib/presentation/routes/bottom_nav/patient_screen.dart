import 'package:afyacare/application/medicine/medicine_bloc.dart';
import 'package:afyacare/application/medicine/medicine_event.dart';
import 'package:afyacare/application/profile/bloc/profile_bloc.dart';
import 'package:afyacare/application/record/bloc/record_bloc.dart';
import 'package:afyacare/domain/record/record_domain.dart';

import 'package:afyacare/application/schedule/bloc/schedule_bloc.dart';

import 'package:afyacare/presentation/pages/search/search.dart';
import 'package:afyacare/presentation/pages/user_profile/profile.dart';
import 'package:afyacare/presentation/pages/user_profile/user_history.dart';
import 'package:afyacare/presentation/routes/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../pages/appointment/upcoming_schedule.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [UpcomingSchedule(), UserHistory(),Search(), UserProfile()];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey.shade100,
          currentIndex: current,
          onTap: (index) {
            setState(() {
              current = index;
            });

            if (index == 1) {
              BlocProvider.of<RecordBloc>(context).add(RecordLoadAllEvent());
            }
            if (index == 0) {
              BlocProvider.of<ScheduleBloc>(context).add(ScheduleLoadEvent());
            }
          },
          selectedItemColor: Colors.green,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.apps_outlined)),
            BottomNavigationBarItem(
                label: "history", icon: Icon(Icons.history)),
            BottomNavigationBarItem(
                label: "search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "profile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
