import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/circle_clip.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfMedicine extends StatefulWidget {
  const ListOfMedicine({Key? key}) : super(key: key);

  @override
  State<ListOfMedicine> createState() => _ListOfMedicineState();
}

class _ListOfMedicineState extends State<ListOfMedicine> {
  List medicines = <Widget>[
    MedicineData(
        imageProvider: const AssetImage("./med1.jfif"),
        medicineName: "Tamirat Dereje",
        quantity: 12,
        desc: "Luis interdum enim enim molestie faucibus. Pretium non non massa eros, nunc, urna. Ac laoreet sagittis donec vel. Amet, duis justo, quam quisque egestas. Quam enim at dictum condimentum. Suspendisse."),
    MedicineData(
        imageProvider: const AssetImage("mag2.png"),
        medicineName: "Abel class",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag3.png"),
        medicineName: "Eyob Zebene",
        quantity: 14,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag4.png"),
        medicineName: "Haile sec3",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag1.png"),
        medicineName: "Rosa ma",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag4.png"),
        medicineName: "bruk mega",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag2.png"),
        medicineName: "Cala se",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag3.png"),
        medicineName: "semere a2sv",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag2.png"),
        medicineName: "mubarek lan",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag3.png"),
        medicineName: "tuna shashe",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag1.png"),
        medicineName: "Tamirat Dereje",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag2.png"),
        medicineName: "Abel class",
        quantity: 12,
        desc: "for bacteria"),
    MedicineData(
        imageProvider: const AssetImage("mag3.png"),
        medicineName: "Eyob Zebene",
        quantity: 12,
        desc: "for bacteria"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const circleClip(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "List of",
                    style: AfyaTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    "Medicines",
                    style: AfyaTheme.lightTextTheme.headline2,
                  ),

                  const SizedBox(
                    height: 80,
                  ),
                  Text("Medicines"),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 3/ 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0
                      ),
                      itemCount: medicines.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>medicineDetail(medicineData: medicines[index],)));
                                },
                          child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          alignment: Alignment.center,
                          child: medicines[index],
                          decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(15)
                          ),

                        ),
                        );
                      },),
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

class MedicineData extends StatelessWidget {
  ImageProvider imageProvider;
  String medicineName;
  String desc;
  int quantity;
  MedicineData(
      {required this.imageProvider, required this.medicineName, required this.quantity, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(

        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Colors.green),
        ),
        margin: const EdgeInsets.all(10),
        child: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),

                    image: DecorationImage(
                      image: imageProvider,
                    )),
              ),

              const SizedBox(
                width: 8,
              ),

              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(medicineName, style: AfyaTheme.lightTextTheme.headline3,),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),


              Row(
                children: [
                  const SizedBox(
                    width: 50,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Available",  style: AfyaTheme.lightTextTheme.caption,),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("$quantity", style: AfyaTheme.lightTextTheme.caption,)
                ],
              )
            ],
          ),
        )
    );
  }
}


class medicineDetail extends StatelessWidget {
  final MedicineData medicineData;

  const medicineDetail({Key? key, required this.medicineData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(medicineData.medicineName),),
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text("Description:", style: AfyaTheme.lightTextTheme.headline3),
          SizedBox(
            height: 10,
          ),
          Text(
              medicineData.desc,style: AfyaTheme.lightTextTheme.headline5),
          SizedBox(
            height: 10,
          ),
          Text(
            "Quantity Available: ${medicineData.quantity}",style: AfyaTheme.lightTextTheme.headline4)
        ],
      ),
      ),
    );
  }
}
