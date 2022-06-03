import 'package:afyacare/presentation/core/afya_theme.dart';
import 'package:afyacare/presentation/core/widgets/custom_button.dart';
import 'package:afyacare/presentation/pages/search/widget/search_result.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/circle_clip.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        circleClip(),
        Column(
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
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
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
                        onPressed: () {},
                        child: CustomButton(
                          title: "",
                          icon: Icons.search,
                          width: 55,
                          height: 55,
                          iconVisiblity: true,
                        ))
                  ],
                ),
              ),
            ),
            SearchResult()
          ],
        ),
      ]),
    );
  }
}
