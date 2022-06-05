import 'package:afyacare/application/medicine/medicine_bloc.dart';
import 'package:afyacare/application/medicine/medicine_event.dart';
import 'package:afyacare/application/medicine/medicine_state.dart';
import 'package:afyacare/domain/Medicine/medicine_name.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/loading.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation/pages/search/widget/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/circle_clip.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => SearchState();
}

class SearchState extends State<Search> {
  SearchState();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        circleClip(),
        SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Search medicine",
                  style: AfyaTheme.lightTextTheme.headline2,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            key: Key("search"),
                            controller: _searchController,
                            decoration: InputDecoration(
                                labelText: "Search",
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.green),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 2, color: Colors.green),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                          ),
                        ),
                        TextButton(
                            key: Key("button"),
                            onPressed: () {
                              print(_formKey.currentState);
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<MedicineBLoc>(context).add(
                                    SearchMedicine(_searchController.text));
                              }
                            },
                            child: const CustomButton(
                              title: "",
                              icon: Icons.search,
                              iconVisiblity: true,
                              width: 55,
                              height: 55,
                              // iconVisiblity = true,
                            )),
                      ],
                    ),
                  ),
                ),
                BlocConsumer<MedicineBLoc, MedicineState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is SearchingMed) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(child: CircularProgressIndicator())
                          ],
                        );
                      } else if (state is MedicinesSearchSuccess) {
                        return SearchResult(results: state.medicineModel);
                      }
                      return Container(
                        child: Center(child: Text("No Result")),
                      );
                    })
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
