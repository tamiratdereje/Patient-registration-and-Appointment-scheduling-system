
import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:intl/intl.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';

class AppointedPatient extends StatefulWidget {
  const AppointedPatient({Key? key}) : super(key: key);

  @override
  State<AppointedPatient> createState() => _AppointedPatientState();
}

class _AppointedPatientState extends State<AppointedPatient> {
  List contact = <Widget>[
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Tamirat Dereje",
        message: "hey where are u at i am looking for you"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Abel class",
        message: "hey"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Eyob Zebene",
        message: "ahh"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Haile sec3",
        message: "xorpina"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Rosa ma",
        message: "yeah "),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "bruk mega",
        message: "i am looking for you"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Cala se",
        message: "where are u "),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "semere a2sv",
        message: "fondayou"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "mubarek lan",
        message: "hey hey"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "tuna shashe",
        message: "alewu tefak"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Tamirat Dereje",
        message: "hey where are u at i am looking for you"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Abel class",
        message: "hey"),
    EachContact(
        imageProvider: AssetImage("assets/profile.jpg"),
        name: "Eyob Zebene",
        message: "ahh"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Appointed",
                    style: AfyaTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    "Patient",
                    style: AfyaTheme.lightTextTheme.headline2,
                  ),

                  SizedBox(
                    height: 80,
                  ),

                  // Expanded(
                  //   child: ,
                  // ),
                  Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: contact.length,
                        itemBuilder: (BuildContext context, int index) {
                          return contact[index];
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EachContact extends StatelessWidget {
  ImageProvider imageProvider;
  String name;
  String message;
  EachContact(
      {required this.imageProvider, required this.name, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints.expand(width: 40, height: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: imageProvider,
                )),
          ),
        
          SizedBox(
            width: 8,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AfyaTheme.lightTextTheme.headline3,),
                SizedBox(
                  height: 5,
                ),
                Text(message, style: AfyaTheme.lightTextTheme.bodyText2,),
              ],
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Row(
            children: [
              IconButton(onPressed: (){
                showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Remove patient'),
                                        content: const Text(
                                            'Are you sure you want to remove patient?'),
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
              }, icon: Icon(Icons.person_remove),color: Colors.red,),
              SizedBox(
                width: 5,
              ),
             
            ],
          )
        ],
      ),
    );
  }
}
