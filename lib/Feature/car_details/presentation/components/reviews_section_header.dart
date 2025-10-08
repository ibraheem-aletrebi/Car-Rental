import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewsSectionHeader extends StatelessWidget {
  const ReviewsSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews (100)',
          style: AppStyles.semiBold16.copyWith(fontSize: 18.sp),
        ),
        Text(
          'See All',
          style: AppStyles.regular14.copyWith(color: AppColors.kPrimaryColor),
        ),
      ],
    );
  }
}
