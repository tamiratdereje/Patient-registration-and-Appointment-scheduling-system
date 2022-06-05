import 'package:afyacare/application/schedule/bloc/schedule_bloc.dart';
import 'package:afyacare/domain/schedule/schedule_id.dart';
import 'package:afyacare/presentation/routes/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    
        name: "Dr.Chaltu Abduba",
        specialization: "Oncologist"),
    Card1(
    
        name: "Dr.Sameuel kebeto",
        specialization: "Gynecologist"),
    Card1(
        name: "Dr.Husen Boru",
        specialization: "Gynecologist"),
  ];

  @override
  Widget build(BuildContext context)  {
    BlocProvider.of<ScheduleBloc>(context).add(ScheduleLoadEvent());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(Screen().appointment);
        },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
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
                      BlocConsumer<ScheduleBloc,ScheduleState>(builder: (context, state) {
                        if(state is ScheduleLoading){
                         return   Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [Center(child: CircularProgressIndicator())],
                                );
                        }
                        else if(state is SchedulesOperationSuccess){
                           return  Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Card1(name: state.schedules[index].userHelper.name, specialization: state.schedules[index].dateTime.toString() , id: state.schedules[index].id.schedule_id,);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: state.schedules.length,
                        ),
                      );
                        }
                        else{
                          return   Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  [Center(child: Text("No Result"),)],
                                );

                        }
                        
                       
                      }, listener: (context , state){}),
                     
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
  String imageProvider = 'assets/profile.jpg';
  String? id ;
  String name;
  String specialization;

  Card1(
      {Key? key,
      this.id,
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
                        specialization.substring(0,10) + ' at ' +specialization.substring(10,13),
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
               
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.push(Screen().editAppointment+'/'+id!);
                    },
                    child: CustomButton(
                      key: Key("reschedule"),
                        title: "Reschedule",
                        width: MediaQuery.of(context).size.width / 2 - 60),
                  ),
                  TextButton(

                   key: Key("cancel"),
                    onPressed: ()async {
                      BlocProvider.of<ScheduleBloc>(context).add(ScheduleDeleteEvent(ScheduleId(schedule_id: id!)));
                      BlocProvider.of<ScheduleBloc>(context).add(ScheduleLoadEvent());
                    },

                    child: CustomButton(
                      key: Key("cancel"),
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
