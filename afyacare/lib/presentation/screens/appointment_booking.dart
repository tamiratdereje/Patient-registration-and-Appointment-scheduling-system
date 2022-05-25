import 'package:afyacare/presentation/common/afya_theme.dart';
import 'package:afyacare/presentation/widgets/brand_name.dart';
import 'package:afyacare/presentation/widgets/circle_clip.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:afyacare/presentation/widgets/custom_button.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';

class AppointmentBooking extends StatefulWidget {
  const AppointmentBooking({Key? key}) : super(key: key);

  @override
  State<AppointmentBooking> createState() => _AppointmentBookingState();
}

class _AppointmentBookingState extends State<AppointmentBooking> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController placeofResidence = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  TextEditingController genderController = TextEditingController();
  String _selectedGender = 'male';

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    placeofResidence.dispose();
    phoneNumber.dispose();
    birthdayController.dispose();
    genderController.dispose();
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
                        TextData().appointmentTitle,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(TextData().appointmentDetail),
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
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: phoneNumber,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        labelText: "Phone number",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !value.isPhone()) {
                                          return "Enter correct Phone number";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    
                                    TextFormField(
                                      controller: placeofResidence,
                                      decoration: InputDecoration(
                                        labelText: "Place of residence",
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[a-zA-Z 0-9]+$')
                                                .hasMatch(value)) {
                                          return "Enter correct place name";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      controller:
                                          dateinput, //editing controller of this TextField
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(Icons
                                              .calendar_today), //icon of text field
                                          labelText: "Enter Date"),
                                      readOnly:
                                          true, //set it true, so that user will not able to edit text

                                      onTap: () {
                                        DatePicker.showDateTimePicker(
                                          
                                          context,
                                          showTitleActions: true,
                                          theme: DatePickerTheme(
                                            cancelStyle: TextStyle(color: Colors.white38,),
                                              itemStyle: TextStyle(color: Colors.black),
                                              headerColor: Colors.green,
                                              backgroundColor: Colors.white,
                                              doneStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16)),
                                          
                                          onConfirm: (date) {
                                           
            
                                              String formattedDate =
                                                  DateFormat.yMMMMd('en_US')
                                                      .add_jm()
                                                      .format(date);


                                              setState(() {
                                                dateinput.text =
                                                    formattedDate; //set output date to TextField value.
                                              });
                                            

                                            // _displayDateTime(selectedDateTime);
                                          },
                                          currentTime: DateTime.now(),
                                        );
                                        // });
                                      },
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Pick birthdate";
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
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
                                  child: CustomButton(title: "Submit")),
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
