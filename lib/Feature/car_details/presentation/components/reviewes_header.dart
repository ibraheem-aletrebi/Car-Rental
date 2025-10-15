import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/build_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewesHeader extends StatelessWidget {
  const ReviewesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Icon(CupertinoIcons.star_fill, color: Colors.amber, size: 18.sp),
          SizedBox(width: 5.w),
          Text('5.0', style: AppStyles.semiBold16.copyWith(fontSize: 14.sp)),
          SizedBox(width: 4.w),
          Text(
            'Reviews (10)',
            style: AppStyles.semiBold16.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class LoadingReviewesHeader extends StatelessWidget {
  const LoadingReviewesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildBox(height: 18.sp, width: 18.sp, shape: BoxShape.circle),
          SizedBox(width: 5.w),
          buildBox(height: 12.h, width: 25.w),
          SizedBox(width: 6.w),
          buildBox(height: 12.h, width: 80.w),
        ],
      ),
    );
  }


}
