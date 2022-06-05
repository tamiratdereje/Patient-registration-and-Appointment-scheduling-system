import 'package:afyacare/application/schedule/bloc/schedule_bloc.dart';
import 'package:afyacare/presentation/pages/search/search.dart';
import 'package:afyacare/presentation/pages/user_profile/profile.dart';
import 'package:afyacare/presentation/pages/user_profile/user_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../pages/appointment/upcoming_schedule.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [UpcomingSchedule(), Search(), UserHistory(), UserProfile()];
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
            if(index == 0){
              BlocProvider.of<ScheduleBloc>(context).add(ScheduleLoadEvent());
            }
            setState(() {
              current = index;
            });
          },
          selectedItemColor: Colors.green,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.apps_outlined)),
            BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "history", icon: Icon(Icons.history)),
            BottomNavigationBarItem(label: "profile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
