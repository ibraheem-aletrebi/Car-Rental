import 'package:flutter/material.dart';

class WidthSpace extends StatelessWidget {
  const WidthSpace({super.key,  this.width=16});
  final double width;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: width,);
  }
}