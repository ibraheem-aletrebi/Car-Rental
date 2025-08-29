import 'package:flutter/material.dart';

class HeightSpace extends StatelessWidget {
  const HeightSpace({super.key,  this.height=16});
  final double height;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height:height ,
    );
  }
}