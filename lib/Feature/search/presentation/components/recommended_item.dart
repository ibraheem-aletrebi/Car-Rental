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
              imagePath:
                  'https://imgs.search.brave.com/0fMwmRiS2R6AdLpZWMxv3w9qa-jRWeWVjjGEMhjujGE/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/cHJlbWl1bS1waG90/by90dW5lZC1zcG9y/dHMtcmFjaW5nLWNh/ci13aXRoLWFyY2gt/ZXh0ZW5zaW9ucy1h/aXItc3VzcGVuc2lv/bi1odWdlLXNwb2ls/ZXItM2QtcmVuZGVy/aW5nXzEwMTI2Ni0x/OTE2MS5qcGc_c2Vt/dD1haXNfaW5jb21p/bmcmdz03NDAmcT04/MA',
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
