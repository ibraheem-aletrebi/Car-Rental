import 'package:car_rental/Feature/home/presentation/components/best_car_section.dart';
import 'package:car_rental/Feature/home/presentation/components/car_brands.dart';
import 'package:car_rental/Feature/home/presentation/components/home_app_bar.dart';
import 'package:car_rental/Feature/home/presentation/components/nearby_section.dart';
import 'package:car_rental/Feature/home/presentation/components/rounded_container.dart';
import 'package:car_rental/Feature/home/presentation/components/search_with_filter_section.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              HomeAppBar(),
              HeightSpace(height: 20),
              Divider(color: AppColors.kStokeColor),
              HeightSpace(),
              SearchWithFilterBar(),
              HeightSpace(),
              CarBrands(),
              HeightSpace(height: 27),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: RoundedContainer(
            child: Column(
              children: [
                BestCarsSection(),
                HeightSpace(height: 27.h),
                NearbySection(),
                HeightSpace(height: 100.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
