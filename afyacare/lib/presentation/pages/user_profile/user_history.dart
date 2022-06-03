import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';
import '../../core/afya_theme.dart';
import '../../core/widgets/circle_clip.dart';

class UserHistory extends StatelessWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        const circleClip(),
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "User history",
              style: AfyaTheme.lightTextTheme.headline2,
            ),
            Text(
              "abel mekonen",
              style: AfyaTheme.lightTextTheme.bodyText1,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(TextData().appointmentDetail),
                        ),
                      );
                    }))
          ],
        ),
      ],
    ));
  }
}
