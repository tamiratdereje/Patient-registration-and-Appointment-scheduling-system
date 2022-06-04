import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import "package:flutter/material.dart";
import 'package:go_router/go_router.dart';

class ListOfMedicine extends StatelessWidget {
  const ListOfMedicine({Key? key}) : super(key: key);

  final data = const [
    ["Ethiopia", "land of origin","12"],
    ["Kenya", "land of kenya","42"],
    ["Poland", "land of Poland","52"],
    ["Ukraine", "land of Ukraine","2"],
    ["Russia", "land of russia","14"],
    ["Brazil", "land of brasil","15"],
    ["Australia", "land of australia","16"],
    ["GreenLand", "land of greenland","13"],
    ["Iceland", "land of iceland","120"],
    ["Italy", "land of italy","33"],
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
                SizedBox(height: 20),
                Text(
                  "List of medicines",
                  style: AfyaTheme.lightTextTheme.headline2,
                ),
                SizedBox(
                  height: 30,
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

                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: (){
                                      showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Delete medicine'),
                                        content: const Text(
                                            'Are you sure you want to delete medicine?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, 'OK'),
                                            child: const Text(
                                              'Delete',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );

                                    },
                                    icon: Icon (Icons.highlight_remove_sharp),color: Colors.red,),
                                ),
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
                                        Text("${data[index][2]}",style: TextStyle(color: Colors.white, fontSize: 20),)
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
