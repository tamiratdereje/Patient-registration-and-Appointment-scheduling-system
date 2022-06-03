import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../../core/afya_theme.dart';
import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';

class UpcomingSchedule extends StatefulWidget {
  const UpcomingSchedule({Key? key}) : super(key: key);

  @override
  State<UpcomingSchedule> createState() => _UpcomingScheduleState();
}

class _UpcomingScheduleState extends State<UpcomingSchedule> {
  List schedules = <Widget>[
    Card1(
        imageProvider: 'assets/profile.jpg',
        name: "Dr.Chaltu Abduba",
        specialization: "Oncologist"),
    Card1(
        imageProvider: 'assets/profile.jpg',
        name: "Dr.Sameuel kebeto",
        specialization: "Gynecologist"),
    Card1(
        imageProvider: 'assets/profile.jpg',
        name: "Dr.Husen Boru",
        specialization: "Gynecologist"),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
             floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.add),
      ),

      body: Stack(
        
        children: [

          const circleClip(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Upcoming",
                        style: AfyaTheme.lightTextTheme.headline2,
                      ),
                      Text(
                        "Schedules",
                        style: AfyaTheme.lightTextTheme.headline2,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return schedules[index % schedules.length];
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: schedules.length,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
     
    );
  }
}

class Card1 extends StatelessWidget {
  String imageProvider;
  String name;
  String specialization;

  Card1(
      {Key? key,
      required this.imageProvider,
      required this.name,
      required this.specialization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      shadowColor: Colors.black,
      child: Padding(
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      imageProvider,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AfyaTheme.lightTextTheme.headline3,
                      ),
                      Text(
                        specialization,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(children: const [
                Icon(
                  Icons.access_time_outlined,
                  color: Colors.lightGreen,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Friday,08:00-09:00 Am')
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push('/appointment');
                    },
                    child: CustomButton(
                        title: "Reschedule",
                        width: MediaQuery.of(context).size.width / 2 - 60),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomButton(
                      muted: true,
                      title: "Cancel",
                      width: MediaQuery.of(context).size.width / 2 - 60,
                      // muted: true
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
