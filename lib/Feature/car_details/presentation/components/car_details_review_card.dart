import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsReviewCard extends StatelessWidget {
  const CarDetailsReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Container(
        width: 220.w,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // user info
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: AppColors.kStokeColor,
                  child: Text(
                    'i', // أول حرف من الاسم مثلاً
                    style: AppStyles.semiBold16.copyWith(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'ibraheem',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.semiBold16.copyWith(fontSize: 14.sp),
                      ),
                      Row(
                        children: [
                          Text(
                            '4.9',
                            style: AppStyles.semiBold16.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amber,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Text(
              'Great experience! The car was clean and the process was easy.',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.regular14.copyWith(color: Colors.grey.shade700),
            ),
            const Spacer(),
            Text(
              '2 days ago',
              style: AppStyles.regular14.copyWith(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
