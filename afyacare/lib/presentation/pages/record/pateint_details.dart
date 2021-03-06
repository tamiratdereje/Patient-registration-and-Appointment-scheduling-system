import 'package:afyacare/domain/patient_detail/patient_detail_validator.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation_data/chip_data.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';

import '../../core/afya_theme.dart';
import '../../core/widgets/circle_clip.dart';

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
    return Chip(
      backgroundColor: Color.fromARGB(53, 70, 171, 73),
      deleteIconColor: Color.fromARGB(255, 198, 114, 110),
      label: Text(name),
      labelPadding: EdgeInsets.symmetric(horizontal: 12),
      deleteButtonTooltipMessage: 'Delete',
      deleteIcon: Icon(
          Icons.highlight_off), // The icon displayed when onDeleted is set.
      onDeleted: () {},
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextFormField(
                                            key: Key("medicine"),
                                            controller: prescribeMed,
                                            decoration: InputDecoration(
                                                labelText: "prescribe medicine",
                                                suffixIcon: IconButton(
                                                  key: Key("add"),
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
                                                                                           validator: (value) =>PatientDetailChipsListValidator().patientDetailChipsListValidator(chipsList),

                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: chipsList
                                                      .map((value) =>
                                                          createChip(value))
                                                      .toList()),
                                            ),
                                          ),
                                          TextFormField(
                                            key: Key("description"),
                                            controller: recordDescription,
                                            decoration: const InputDecoration(
                                              labelText: "Record Description",
                                            ),
                                            validator: (value) =>PatientDetailDescriptionValidator().patientDetailDescriptionValidator(value),

                                          ),
                                          const SizedBox(
                                            height:15,
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      key: Key("button"),
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
                            Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: 8,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                              TextData().appointmentDetail),
                                        ),
                                      );
                                    }))
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
