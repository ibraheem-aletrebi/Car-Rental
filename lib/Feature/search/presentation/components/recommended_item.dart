import 'package:car_rental/Feature/home/domain/entities/car_entity.dart';
import 'package:car_rental/Feature/home/presentation/components/car_image_header.dart';
import 'package:car_rental/Feature/search/presentation/components/recommended_car_info.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColors.kDarkWhite, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: CarImageHeader(
              imagePath: Assets.imagesFerrariCar,
              isFavorite: false,
              onFavoritePressed: () {},
            ),
          ),
          Flexible(
            child: RecommendedCarInfo(
              carEntity: CarEntity(
                name: 'Ferrari',
                imagePath: Assets.imagesFerrariCar,
                rating: 4.5,
                location: 'New York',
                seats: 4,
                pricePerDay: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
