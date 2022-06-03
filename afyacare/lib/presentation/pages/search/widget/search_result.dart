import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("herjerkle $index"),
              );
            }));
  }
}
