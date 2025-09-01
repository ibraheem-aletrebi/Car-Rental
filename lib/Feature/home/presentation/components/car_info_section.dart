import 'package:car_rental/Feature/home/domain/entities/car_entity.dart';
import 'package:car_rental/Feature/home/presentation/components/icon_text_row.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/styles/assets.dart';
// Import our new component
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarInfoSection extends StatelessWidget {
  final CarEntity carEntity;
  const CarInfoSection({super.key, required this.carEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            carEntity.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.semiBold14,
          ),
          SizedBox(height: 7.h),

          IconTextRow(
            iconPath: Assets.iconsRating,
            text: carEntity.rating.toString(),
            textStyle: AppStyles.semiBold12,
          ),
          SizedBox(height: 7.h),

          IconTextRow(
            iconPath: Assets.iconsLocation,
            text: carEntity.location,
            textStyle: AppStyles.regular12,
          ),
          SizedBox(height: 7.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconTextRow(
                iconPath: Assets.iconsSeats,
                text: '${carEntity.seats} Seats',
                textStyle: AppStyles.semiBold12,
              ),

              IconTextRow(
                iconPath: Assets.iconsMoney,
                text: '\$${carEntity.pricePerDay}/Day',
                textStyle: AppStyles.semiBold12.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
