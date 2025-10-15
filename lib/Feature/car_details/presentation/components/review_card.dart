import 'package:car_rental/domain/entities/review_entity.dart';
import 'package:car_rental/core/widgets/user_avater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== Header (Avatar + Name + Date)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  UserAvatar(
                    imageUrl: review.userImage,
                    username: review.username,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    review.username,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Text(
                'yesterday',
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // ===== Rating Stars
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < review.rate ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: 18.sp,
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // ===== Review Text
          Text(
            review.review,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13.sp,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
