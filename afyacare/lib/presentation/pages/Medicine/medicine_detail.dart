import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:flutter/material.dart';

class MedicineDetail extends StatelessWidget {
  final int medicineId;

  const MedicineDetail(this.medicineId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medicine Detail"),
      ),
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
            Text("medicineData.desc",
                style: AfyaTheme.lightTextTheme.headline5),
            SizedBox(
              height: 10,
            ),
            Text("Quantity Available: ",
                style: AfyaTheme.lightTextTheme.headline4)
          ],
        ),
      ),
    );
  }
}
