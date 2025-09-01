import 'package:car_rental/Feature/home/domain/entities/car_entity.dart';
import 'package:car_rental/Feature/home/presentation/components/car_image_header.dart';
import 'package:car_rental/Feature/home/presentation/components/car_info_section.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCarItem extends StatelessWidget {
  const HomeCarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186.w,
      height: 240.h,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.kDarkWhite, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CarImageHeader(
              imagePath: Assets.imagesFerrariCar,
              isFavorite: false,
              onFavoritePressed: () {},
            ),
          ),
          Expanded(
            child: CarInfoSection(
              carEntity: CarEntity(
                name: 'Ferrari',
                rating: 4.5,
                location: 'New York',
                pricePerDay: 100,
                imagePath: Assets.imagesFerrariCar,
                seats: 4,
                isFavorite: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
