import 'package:afyacare/application/medicine/medicine_bloc.dart';
import 'package:afyacare/application/medicine/medicine_event.dart';
import 'package:afyacare/application/medicine/medicine_state.dart';
import 'package:afyacare/domain/Medicine/medicine_Domain.dart';
import 'package:afyacare/domain/Medicine/medicine_description.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:afyacare/domain/Medicine/medicine_quantity.dart';
import 'package:afyacare/domain/Medicine/medicine_validator.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController medicineName = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    medicineName.dispose();
    desc.dispose();
    quantity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MedicineBLoc>(
        create: (context) => MedicineBLoc(),
        child: Scaffold(
          body: Stack(
            children: [
              const circleClip(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            "Add",
                            style: AfyaTheme.lightTextTheme.headline2,
                          ),
                          Text(
                            "Medicine",
                            style: AfyaTheme.lightTextTheme.headline2,
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          const Text(
                            "For pharmacist use only!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Form(
                            key: _formKey,
                            child: Container(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                            controller: medicineName,
                                            decoration: const InputDecoration(
                                              labelText: "Medicine Name",
                                            ),
                                            validator: (value) =>
                                                MedicineValidator()
                                                    .medicineNameValidator(
                                                        value)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        TextFormField(
                                            controller: quantity,
                                            keyboardType: TextInputType.number,
                                            decoration: const InputDecoration(
                                              labelText: "Quantity",
                                            ),
                                            validator: (value) =>
                                                MedicineValidator()
                                                    .medicineQuantityValidator(
                                                        value)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        TextFormField(
                                            controller: desc,
                                            keyboardType: TextInputType.text,
                                            decoration: const InputDecoration(
                                              labelText: "Description",
                                            ),
                                            validator: (value) =>
                                                MedicineValidator()
                                                    .medicineDescriptionValidator(
                                                        value)),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocConsumer<MedicineBLoc, MedicineState>(
                                      listener: (context, state) async {
                                    if (state is MedicineAddSuccessful) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Color.fromARGB(
                                                108, 25, 221, 31),
                                            content: Text('Login Successful')),
                                      );
                                    } else if (state is MedicineAdding) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    } else if (state is MedicineAddFailed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.redAccent,
                                            content:
                                                Text('Failed to add Medicine')),
                                      );
                                    }
                                  }, builder: (context, state) {
                                    return TextButton(
                                        onPressed: () {
                                          MedicineDomain medicineDomain =
                                              MedicineDomain(
                                                  name: MedicineName(
                                                      medicineName:
                                                          medicineName.text),
                                                  descrption:
                                                      MedicineDescription(
                                                          medicineDescription:
                                                              desc.text),
                                                  quantity: MedicineQuantity(
                                                      medicineQuantity:
                                                          int.parse(
                                                              quantity.text)));

                                          BlocProvider.of<MedicineBLoc>(context)
                                              .add(MedicineCreateEvent(
                                                  medicineDomain));
                                          desc.clear();
                                          quantity.clear();
                                          medicineName.clear();
                                        },
                                        child: CustomButton(title: "Add"));
                                  }),
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
        ));
  }
}
