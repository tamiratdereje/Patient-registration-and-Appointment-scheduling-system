import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  final results;
  const SearchResult({required this.results, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        Text(results.name),
        Text(results.descrption),
        Text(
          results.quantity.toString(),
        )
      ],
    ));
    // width: MediaQuery.of(context).size.width,
    // height: MediaQuery.of(context).size.width,
  }
}
