import 'package:car_rental/Feature/home/presentation/components/icon_text_row.dart';
import 'package:car_rental/data/models/car_model.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/resources/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarInfoSection extends StatelessWidget {
  final CarModel carModel;
  const CarInfoSection({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            carModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.semiBold14,
          ),
          SizedBox(height: 7.h),

          IconTextRow(
            iconPath: Assets.iconsRating,
            text: carModel.averageRate.toString(),
            textStyle: AppStyles.semiBold12,
          ),
          SizedBox(height: 7.h),

          IconTextRow(
            iconPath: Assets.iconsLocation,
            text: carModel.location.name,
            textStyle: AppStyles.regular12,
          ),
          SizedBox(height: 7.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: IconTextRow(
                  iconPath: Assets.iconsSeats,
                  text: carModel.seatingCapacity,
                  textStyle: AppStyles.semiBold12,
                ),
              ),
              if (carModel.dailyRent != null)
                Flexible(
                  child: IconTextRow(
                    iconPath: Assets.iconsMoney,
                    text: '\$${carModel.dailyRent?.round()}/Day',
                    textStyle: AppStyles.semiBold12.copyWith(
                      color: AppColors.kPrimaryColor,
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
