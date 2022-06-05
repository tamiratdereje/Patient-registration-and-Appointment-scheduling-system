import 'package:afyacare/domain/Medicine/medicine_validator.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MedicineDetail extends StatefulWidget {
  final int? medicineId;

  MedicineDetail({this.medicineId});

  @override
  State<MedicineDetail> createState() => _MedicineDetailState();
}

class _MedicineDetailState extends State<MedicineDetail> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _medicineName = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _desc = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _medicineName.text = "paracetamol";
    _quantity.text = "5";
    _desc.text = "paracetamol made in italy";
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _medicineName.dispose();
    _desc.dispose();
    _quantity.dispose();
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
                        "Edit",
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
                                        controller: _medicineName,
                                        decoration: InputDecoration(
                                            labelText: "Medicine Name",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 2.0,
                                              ),
                                            )),
                                        validator: (value) =>
                                            MedicineValidator()
                                                .medicineNameValidator(value)),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                        controller: _quantity,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            labelText: "Quantity",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 2.0,
                                              ),
                                            )),
                                        validator: (value) =>
                                            MedicineValidator()
                                                .medicineQuantityValidator(
                                                    value)),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    TextFormField(
                                        maxLines: 3,
                                        controller: _desc,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                            labelText: "Description",
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              borderSide: BorderSide(
                                                color: Colors.green,
                                                width: 2.0,
                                              ),
                                            )),
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
                              TextButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Editing medicine Data')),
                                      );
                                    }
                                  },
                                  child: const CustomButton(title: "Save")),
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
