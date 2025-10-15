import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return     Divider(height: 1, thickness: 0.5, color: Colors.grey[300], indent: 60.w);
  }
}