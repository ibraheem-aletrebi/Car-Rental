import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarBrandItemLoading extends StatelessWidget {
  const CarBrandItemLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: 60.w,
              height: 60.h,
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(height: 8.h),
          Container(width: 40.w, height: 12.h, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}