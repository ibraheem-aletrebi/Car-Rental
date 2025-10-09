import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookCarButton extends StatelessWidget {
  const BookCarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: ElevatedButton.icon(
        iconAlignment: IconAlignment.end,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.kPrimaryColor,
          minimumSize: Size(double.infinity, 62.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(62),
          ),
        ),
        onPressed: () {},
        label: Text(
          'Book Now',
          style: AppStyles.semiBold14.copyWith(color: AppColors.kWhiteColor),
        ),
        icon: Icon(Icons.arrow_forward, color: AppColors.kWhiteColor),
      ),
    );
  }
}
