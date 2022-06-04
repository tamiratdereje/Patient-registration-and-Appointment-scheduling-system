import 'package:afyacare/domain/Medicine/medicine_validator.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
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
    return Scaffold(
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
                                      key: Key("name"),
                                        controller: medicineName,
                                        decoration: const InputDecoration(
                                          labelText: "Medicine Name",
                                        ),
                                        validator: (value) =>
                                            MedicineValidator()
                                                .medicineNameValidator(value)),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                      key: Key("quantity"),
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
                                      key: Key("description"),
                                        controller: desc,
                                        keyboardType: TextInputType.text,
                                        decoration: const InputDecoration(
                                          labelText: "Description",
                                        ),
                                        validator: (value) =>
                                            MedicineValidator()
                                                .medicineDescriptionValidator(value)),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                key: Key("button"),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Adding medicine Data')),
                                      );
                                    }
                                  },
                                  child: const CustomButton(title: "Add")),
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
