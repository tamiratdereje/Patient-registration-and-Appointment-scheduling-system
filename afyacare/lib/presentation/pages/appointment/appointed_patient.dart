import 'package:afyacare/application/schedule/bloc/schedule_bloc.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';

class AppointedPatient extends StatefulWidget {
  const AppointedPatient({Key? key}) : super(key: key);

  @override
  State<AppointedPatient> createState() => _AppointedPatientState();
}

class _AppointedPatientState extends State<AppointedPatient> {
  List contact = <Widget>[
    EachContact(
        name: "Tamirat Dereje",
        message: "hey where are u at i am looking for you"),
    EachContact(name: "Abel class", message: "hey"),
    EachContact(name: "Eyob Zebene", message: "ahh"),
    EachContact(name: "Haile sec3", message: "xorpina"),
    EachContact(name: "Rosa ma", message: "yeah "),
    EachContact(name: "bruk mega", message: "i am looking for you"),
    EachContact(name: "Cala se", message: "where are u "),
    EachContact(name: "semere a2sv", message: "fondayou"),
    EachContact(name: "mubarek lan", message: "hey hey"),
    EachContact(name: "tuna shashe", message: "alewu tefak"),
    EachContact(
        name: "Tamirat Dereje",
        message: "hey where are u at i am looking for you"),
    EachContact(name: "Abel class", message: "hey"),
    EachContact(name: "Eyob Zebene", message: "ahh"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Appointed",
                  style: AfyaTheme.lightTextTheme.headline2,
                ),
                Text(
                  "Patient",
                  style: AfyaTheme.lightTextTheme.headline2,
                ),

                SizedBox(
                  height: 80,
                ),

                // Expanded(
                //   child: ,
                // ),
                BlocBuilder<ScheduleBloc, ScheduleState>(
                    builder: (context, state) {
                  if (state is SchedulesOperationSuccess) {
                    return Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: state.schedules.length,
                          itemBuilder: (BuildContext context, int index) {
                            return EachContact(
                                name: state.schedules[index].userHelper.name,
                                message: state
                                    .schedules[index].dateTime.dateTime
                                    .toString());
                          }),
                    );
                  } else if (state is ScheduleLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator())
                      ],
                    );
                  }
                  return Container(
                    child: Center(child: Text("No Result")),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EachContact extends StatelessWidget {
  ImageProvider imageProvider = AssetImage("assets/profile.jpg");
  String name;
  String message;
  EachContact({required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints.expand(width: 40, height: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: imageProvider,
                )),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AfyaTheme.lightTextTheme.headline3,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  message,
                  style: AfyaTheme.lightTextTheme.bodyText2,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Remove patient'),
                      content: const Text(
                          'Are you sure you want to remove patient?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text(
                            'Delete',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.person_remove),
                color: Colors.red,
              ),
              SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
