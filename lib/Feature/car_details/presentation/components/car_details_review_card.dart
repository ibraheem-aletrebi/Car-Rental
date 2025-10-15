import 'package:car_rental/domain/entities/review_entity.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/widgets/user_avater.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarDetailsReviewCard extends StatelessWidget {
  const CarDetailsReviewCard({super.key, required this.review});
  final ReviewEntity review;
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
                UserAvatar(
                  imageUrl: review.userImage,
                  username: review.username,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review.username,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.semiBold16.copyWith(fontSize: 14.sp),
                      ),
                      Row(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            review.rate.toString(),
                            style: AppStyles.semiBold16.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amber,
                            size: 18,
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
              review.review,
              maxLines: 2,
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
