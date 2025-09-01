import 'package:car_rental/Feature/home/presentation/components/best_car_section.dart';
import 'package:car_rental/Feature/home/presentation/components/nearby_section.dart';
import 'package:car_rental/Feature/home/presentation/components/rounded_container.dart';
import 'package:car_rental/Feature/home/presentation/components/search_with_filter_section.dart';

import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchWithFilterBar(),
        HeightSpace(height: 27),
        Expanded(
          child: RoundedContainer(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 70.h),
              child: Column(
                children: [
                  BestCarsSection(),
                  HeightSpace(height: 27.h),
                  NearbySection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
