import 'package:car_rental/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyItem extends StatelessWidget {
  const NearbyItem({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 321 / 121,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.kStokeColor,
        ),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}
