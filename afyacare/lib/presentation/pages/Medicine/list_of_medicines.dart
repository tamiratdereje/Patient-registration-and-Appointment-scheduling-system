import 'package:afyacare/application/medicine/medicine_bloc.dart';
import 'package:afyacare/application/medicine/medicine_event.dart';
import 'package:afyacare/application/medicine/medicine_state.dart';
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/loading.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:afyacare/presentation/pages/Error/error.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListOfMedicine extends StatelessWidget {
  const ListOfMedicine({Key? key}) : super(key: key);

  final data = const [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: BlocBuilder<MedicineBLoc, MedicineState>(
              builder: ((context, state) {
            if (state is MedicineLoading) {
              return Loading();
            } else if (state is MedicinesOperationSuccess) {
            
              return Stack(
                children: [
                  const circleClip(),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "List of medicine",
                          style: AfyaTheme.lightTextTheme.headline2,
                        ),
                        const SizedBox(
                          height: 55,
                        ),
                        Text(
                          "Medicines",
                          style: AfyaTheme.lightTextTheme.headline3,
                        ),
                        Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 30,
                              ),
                              itemCount: state.medicines.length,
                              itemBuilder: (BuildContext context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    
                                  },
                                  child: Container(
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      children: [
                                        Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 15),
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state
                                                          .medicines[index].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Text(state
                                                    .medicines[index].quantity
                                                    .toString())
                                              ],
                                            ))
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/medicine.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else {
              return NoResultFoundScreen();
            }
          })),
        );
  }
}
