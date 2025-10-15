import 'package:car_rental/core/widgets/build_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingReviewCard extends StatelessWidget {
  const LoadingReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===== Header Placeholder
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                buildBox(height: 36.w, width: 36.w, shape: BoxShape.circle),
                SizedBox(width: 8.w),
                buildBox(height: 12.h, width: 60.w),
              ],
            ),
            buildBox(height: 10.h, width: 40.w),
          ],
        ),
    
        SizedBox(height: 10.h),
    
        // ===== Stars Placeholder
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(right: 3.w),
              child: buildBox(
                height: 14.w,
                width: 14.w,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
    
        SizedBox(height: 8.h),
    
        // ===== Review Text Placeholder
        buildBox(height: 10.h, width: double.infinity),
        SizedBox(height: 6.h),
        buildBox(height: 10.h, width: 200.w),
        SizedBox(height: 6.h),
        buildBox(height: 10.h, width: 150.w),
      ],
    );
  }

  
}
