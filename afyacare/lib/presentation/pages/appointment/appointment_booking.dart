import '../../core/afya_theme.dart';
import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/circle_clip.dart';
import '../../core/widgets/custom_button.dart';
import 'appointment_text.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({Key? key}) : super(key: key);

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  final _formKey = GlobalKey<FormState>();

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
                                child: TextField(
                                  controller: dateinput,
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
                                    String timeString = selectedTime.toString().substring(10, 15);
                                    String dateString = selectedDate
                                        .toString()
                                        .substring(0, 10);

                                    if (selectedDate  != null && selectedTime != null) {
                                      setState(() {
                                        dateinput.text = dateString +" at  "+ timeString;
                                      });
                                    }
                                  },
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  child: CustomButton(
                                    title: "Submit",
                                  )),
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
