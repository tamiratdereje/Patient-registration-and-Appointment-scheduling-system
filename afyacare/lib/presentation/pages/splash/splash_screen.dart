import 'package:afyacare/presentation/core/widgets/brand_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: BrandName()),
        
      ),
    );
  }
}