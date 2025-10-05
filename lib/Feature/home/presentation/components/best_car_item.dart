import 'package:car_rental/Feature/home/presentation/components/car_image_header.dart';
import 'package:car_rental/Feature/home/presentation/components/car_info_section.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestCarItem extends StatelessWidget {
  const BestCarItem({super.key, required this.carModel});
  final CarModel carModel;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 186.w / 237.h,
      child: Container(
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
                imagePath: carModel.image,
                isFavorite: false,
                onFavoritePressed: () {},
              ),
            ),
            Expanded(child: CarInfoSection(carModel: carModel)),
          ],
        ),
      ),
    );
  }
}
