import 'package:afyacare/presentation/common/afya_theme.dart';
import 'package:afyacare/presentation/widgets/brand_name.dart';
import 'package:afyacare/presentation/widgets/circle_clip.dart';
import 'package:afyacare/presentation_data/chip_data.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:afyacare/presentation/widgets/custom_button.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';

class PatientDetails extends StatefulWidget {
  const PatientDetails({Key? key}) : super(key: key);

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  final _recordFormKey = GlobalKey<FormState>();
  TextEditingController recordDescription = TextEditingController();
  TextEditingController prescribeMed = TextEditingController();
  List<String> chipsList = chips().chipsList;

  Widget createChip(String name) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Chip(
        label: Text(name),
        labelPadding: EdgeInsets.all(6),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    recordDescription.dispose();
    prescribeMed.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          "Pateint",
                          style: AfyaTheme.lightTextTheme.headline2,
                        ),
                        Text(
                          "Details",
                          style: AfyaTheme.lightTextTheme.headline2,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Form(
                              key: _recordFormKey,
                              child: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            controller: prescribeMed,
                                            decoration: InputDecoration(
                                                labelText: "prescribe medicine",
                                                suffixIcon: IconButton(
                                                    onPressed: (() =>
                                                        setState(() {
                                                          if (prescribeMed.text
                                                              .isNotEmpty) {
                                                            chipsList.add(
                                                                prescribeMed
                                                                    .text);
                                                          }
                                                          prescribeMed.clear();
                                                        })),
                                                    icon:
                                                        const Icon(Icons.add))),
                                            validator: (value) {
                                              if (value!.isEmpty &&
                                                  chipsList.isEmpty) {
                                                return "Enter correct medicine name ";
                                              } else {
                                                return null;
                                              }
                                            },
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          TextFormField(
                                            controller: recordDescription,
                                            decoration: const InputDecoration(
                                              labelText: "Record Description",
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Enter correct Record Description";
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
                                    SizedBox(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                            children: chipsList
                                                .map((value) =>
                                                    createChip(value))
                                                .toList()),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          if (_recordFormKey.currentState!
                                              .validate()) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                  content:
                                                      Text('Processing Data')),
                                            );

                                            setState(() {
                                              if (!prescribeMed
                                                  .text.isNotEmpty) {
                                                chipsList
                                                    .add(prescribeMed.text);
                                              }
                                            });
                                          }
                                        },
                                        child: const CustomButton(
                                            title: "Save Record")),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(TextData().appointmentDetail),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(TextData().appointmentDetail),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(TextData().appointmentDetail),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(TextData().appointmentDetail),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(TextData().appointmentDetail),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(TextData().appointmentDetail),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
