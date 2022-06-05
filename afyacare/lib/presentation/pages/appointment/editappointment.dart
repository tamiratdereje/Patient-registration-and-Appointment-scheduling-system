import 'package:afyacare/application/schedule/bloc/schedule_bloc.dart';
import 'package:afyacare/domain/appointment_booking/appointment_booking_validator.dart';
import 'package:afyacare/domain/schedule/schedule_date_time.dart';
import 'package:afyacare/domain/schedule/schedule_domain.dart';
import 'package:afyacare/presentation/routes/path.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/afya_theme.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';
import 'appointment_text.dart';

class EditAppointment extends StatefulWidget {
  String id;
   EditAppointment({required this.id ,Key? key}) : super(key: key);

  @override
  State<EditAppointment> createState() => _EditAppointmentState(id:id);
}

class _EditAppointmentState extends State<EditAppointment> {
 
 String id ;
 
 
  _EditAppointmentState({required this.id});
  final _formKey = GlobalKey<FormState>();
  late String result = "";

  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    // dateinput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.

    dateinput.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("---------------------------------------------");
    print(id);
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Appointment",
                        style: AfyaTheme.lightTextTheme.headline2,
                      ),
                      Text(
                        "Booking",
                        style: AfyaTheme.lightTextTheme.headline2,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        AppointmentText().appointmentTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(AppointmentText().appointmentDetail),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: TextFormField(
                                
                                  key: Key("date"),
                                  controller: dateinput,
                                  validator: (value) =>
                                      AppointmentBookingValidator()
                                          .appointmentBookingValidator(value),
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons
                                          .calendar_today), //icon of text field
                                      labelText: "Enter Date and time"),
                                  onTap: () async {
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025),
                                      initialDate: DateTime.now(),
                                      // selectableDayPredicate: (day) =>
                                      //     day.isAfter(DateTime.now()),
                                    );

                                    final selectedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                      initialEntryMode:
                                          TimePickerEntryMode.dial,
                                    );
                                    print(selectedTime);
                                    String timeString = selectedTime
                                        .toString()
                                        .substring(10, 15);
                                    String dateString = selectedDate
                                        .toString()
                                        .substring(0, 10);
                                    result = dateString +" " + timeString;
                                    if (selectedDate != null &&
                                        selectedTime != null) {
                                      setState(() {
                                        dateinput.text =
                                            dateString + " at  " + timeString;
                                      });
                                    }
                                  },
                                ),
                              ),
                              BlocConsumer<ScheduleBloc, ScheduleState>(
                                listener: (context, state) {


                                if (state is ScheduleAddSuccessful) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor:
                                            Color.fromARGB(108, 25, 221, 31),
                                        content: Text('scheduled Successful')),
                                  );
                                 
                                } else if (state is ScheduleAdding) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                } else if (state is ScheduleAddFailed) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content:
                                            Text('scheduled Failed Try again')),
                                  );
                                }


                                // },
                                // if (_formKey.currentState!.validate()) {
                                //           DateTime scheDate =
                                //             DateTime.parse(result);
                                            

                                //           BlocProvider.of<ScheduleBloc>(context).add(ScheduleUpdateEvent(time: scheDate, id: id));

                                //         }
                                
                                },

                                builder: (context, state) {
                                  return TextButton(
                                      key: Key("submit"),
                                      onPressed: () {
                                        

                                        if (_formKey.currentState!.validate()) {
                                          DateTime scheDate =
                                            DateTime.parse(result);
                                            

                                          BlocProvider.of<ScheduleBloc>(context).add(ScheduleUpdateEvent(time: scheDate, id: id));

                                        }
                                      },
                                      child: CustomButton(
                                        title: "Submit",
                                      ));
                                },
                          )
                          
                          ],
                          ),
                        ),
                      ),
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
