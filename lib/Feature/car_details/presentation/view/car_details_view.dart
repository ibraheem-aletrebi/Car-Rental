import 'package:car_rental/Feature/car_details/presentation/components/car_details_view_body.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.carId});
  final int carId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CarDetailsViewBody()),

      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      ),
    );
  }
}
