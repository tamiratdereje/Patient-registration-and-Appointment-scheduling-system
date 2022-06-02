import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/widgets/custom_button.dart';

class NoResultFoundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/14_No Search Results.png",
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.10,
            left: MediaQuery.of(context).size.width * 0.065,
            right: MediaQuery.of(context).size.width * 0.065,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Color(0xFF5666C2).withOpacity(0.17),
                  ),
                ],
              ),
              child:  TextButton(
                              onPressed: () {
                                  context.go('/');
                              },
                              child: CustomButton(title: "Homepage"),
                            ),
            ),
          )
        ],
      ),
    );
  }
}
