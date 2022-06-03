import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

class ListOfMedicine extends StatelessWidget {
  const ListOfMedicine({Key? key}) : super(key: key);

  final data = const [
    ["Ethiopia", "land of origin"],
    ["Kenya", "land of kenya"],
    ["Poland", "land of Poland"],
    ["Ukraine", "land of Ukraine"],
    ["Russia", "land of russia"],
    ["Brazil", "land of brasil"],
    ["Australia", "land of australia"],
    ["GreenLand", "land of greenland"],
    ["Iceland", "land of iceland"],
    ["Italy", "land of italy"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          SizedBox(
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
                SizedBox(
                  height: 55,
                ),
                Text(
                  "Medicines",
                  style: AfyaTheme.lightTextTheme.headline3,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                      ),
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.push('/medicineDetail/5');
                          },
                          child: Container(
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 15),
                                    color: Colors.black.withOpacity(0.6),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data[index][0]}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("${data[index][1]}",
                                                style: TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 15)),
                                          ],
                                        ),
                                        Text("10")
                                      ],
                                    ))
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/medicine.png"),
                                    fit: BoxFit.cover)),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
