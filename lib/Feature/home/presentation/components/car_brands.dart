import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarBrands extends StatelessWidget {
  const CarBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brands', style: AppStyles.semiBold16),
          HeightSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              return Column(
                spacing: 18.h,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(Assets.imagesBmw),
                  ),
                  Text('BMW', style: AppStyles.semiBold12),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
