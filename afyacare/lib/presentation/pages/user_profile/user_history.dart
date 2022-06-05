import 'package:afyacare/application/record/bloc/record_bloc.dart';
import 'package:afyacare/infrastructure/core/sharedPref.dart';
import 'package:afyacare/presentation_data/text_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/afya_theme.dart';
import '../../core/widgets/circle_clip.dart';

class UserHistory extends StatelessWidget {
  SharedPref pref = SharedPref();

  UserHistory({Key? key}) : super(key: key);

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
            // Text(
            //   "abel mekonen",
            //   style: AfyaTheme.lightTextTheme.bodyText1,
            // ),
            const SizedBox(
              height: 30,
            ),
            BlocConsumer<RecordBloc, RecordState>(
                builder: (context, state) {
                  if (state is RecordLoading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator())
                      ],
                    );
                  }
                  if (state is RecordOperationSuccess) {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: state.records.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(state
                                      .records[index].descrption.descrption),
                                ),
                              );
                            }));
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Center(child: Text("No Result!"))],
                    );
                  }
                },
                listener: (context, state) {})
          ],
        ),
      ],
    ));
  }
}
