import 'package:car_rental/Feature/car_details/presentation/components/car_features_grid.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarFeaturesSection extends StatelessWidget {
  const CarFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Car Features',
          style: AppStyles.semiBold16.copyWith(fontSize: 18.sp),
        ),
        HeightSpace(),
        const CarFeaturesGrid(),
      ],
    );
  }
}
