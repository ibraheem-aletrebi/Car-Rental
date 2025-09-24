import 'package:car_rental/Feature/home/presentation/components/icon_text_row.dart';
import 'package:car_rental/core/models/car_model.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/styles/assets.dart';
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
            children: [
              IconTextRow(
                iconPath: Assets.iconsSeats,
                text: '${carModel.seatingCapacity} Seats',
                textStyle: AppStyles.semiBold12,
              ),
              carModel.dailyRent == null
                  ? const SizedBox.shrink()
                  : IconTextRow(
                      iconPath: Assets.iconsMoney,
                      text: '\$${carModel.dailyRent?.round()}/Day',
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
