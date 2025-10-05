import 'package:car_rental/Feature/home/domain/entities/car_entity.dart';
import 'package:car_rental/Feature/home/presentation/components/icon_text_row.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/resources/assets.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/width_space.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedCarInfo extends StatelessWidget {
  const RecommendedCarInfo({super.key, required this.carEntity});
  final CarEntity carEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Column(
        spacing: 7.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            carEntity.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.semiBold14,
          ),

          IconTextRow(
            iconPath: Assets.iconsRating,
            text: carEntity.rating.toString(),
            textStyle: AppStyles.semiBold12,
          ),

          IconTextRow(
            iconPath: Assets.iconsLocation,
            text: carEntity.location,
            textStyle: AppStyles.regular12,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: IconTextRow(
                  iconPath: Assets.iconsMoney,
                  text: '\$${carEntity.pricePerDay}/Day',
                  textStyle: AppStyles.semiBold12.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
              WidthSpace(width: 5),

              Flexible(
                child: CustomButton(
                  text: 'Book Now',
                  onPressed: () {},
                  height: 30.h,
                  textStyle: AppStyles.semiBold12.copyWith(
                    color: AppColors.kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
