import 'package:car_rental/Feature/home/presentation/components/icon_text_row.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 255 / 88,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.kDarkWhite,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: AppColors.kStokeColor,
            width: 2,
          ),
        ),
        child: Row(
          spacing: 10,
          children: [
            Image.asset(
              Assets.imagesFerrariCar,
              fit: BoxFit.contain,
            ),
            Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ferrari',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.semiBold16,
                ),
                IconTextRow(
                  iconPath: Assets.iconsRating,
                  text: '5.0',
                  textStyle: AppStyles.semiBold12,
                ),
                IconTextRow(
                  iconPath: Assets.iconsMoney,
                  text: r'$100/Day',
                  textStyle: AppStyles.semiBold12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
