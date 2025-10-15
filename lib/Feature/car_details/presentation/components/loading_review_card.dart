import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingReviewCard extends StatelessWidget {
  const LoadingReviewCard({super.key});

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
          // ===== Header Placeholder
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildBox(height: 36.w, width: 36.w, shape: BoxShape.circle),
                  SizedBox(width: 8.w),
                  _buildBox(height: 12.h, width: 60.w),
                ],
              ),
              _buildBox(height: 10.h, width: 40.w),
            ],
          ),

          SizedBox(height: 10.h),

          // ===== Stars Placeholder
          Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.only(right: 3.w),
                child: _buildBox(
                  height: 14.w,
                  width: 14.w,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          SizedBox(height: 8.h),

          // ===== Review Text Placeholder
          _buildBox(height: 10.h, width: double.infinity),
          SizedBox(height: 6.h),
          _buildBox(height: 10.h, width: 200.w),
          SizedBox(height: 6.h),
          _buildBox(height: 10.h, width: 150.w),
        ],
      ),
    );
  }

  Widget _buildBox({
    required double height,
    required double width,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.circular(6.r)
            : null,
      ),
    );
  }
}
