import 'package:afyacare/presentation/pages/medicine/add_medicine.dart';
import 'package:afyacare/presentation/pages/medicine/list_of_medicines.dart';
import 'package:afyacare/presentation/pages/user_profile/profile.dart';
import 'package:flutter/material.dart';

class PharmacistScreen extends StatefulWidget {
  const PharmacistScreen({Key? key}) : super(key: key);

  @override
  State<PharmacistScreen> createState() => _PharmacistScreenState();
}

class _PharmacistScreenState extends State<PharmacistScreen> {
  List pages = [ const ListOfMedicine(),const AddMedicine(), const UserProfile()];
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed ,
        backgroundColor: Colors.grey.shade100,
          currentIndex: current,
          onTap: (index) {
            setState(() {
              current = index;
            });
          },
          selectedItemColor: Colors.green,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.apps_outlined)),
            BottomNavigationBarItem(label: "add", icon: Icon(Icons.add_box_sharp)),
            BottomNavigationBarItem(label: "profile", icon: Icon(Icons.person)
            ),
          ]
          ),
    );
  }
}
