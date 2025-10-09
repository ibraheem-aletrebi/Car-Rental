import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarFeatureCard extends StatelessWidget {
  const CarFeatureCard({
    super.key,
    required this.title,
    required this.value,
    required this.imagePath,
  });
  final String title;
  final String value;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CachedNetworkImage(
              imageUrl: imagePath,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 24.h,
              width: 24.w,
            ),
          ),
          SizedBox(height: 4.h),
          Text(title, style: AppStyles.regular14.copyWith(fontSize: 12.sp)),
          Text(value, style: AppStyles.semiBold16.copyWith(fontSize: 14.sp)),
        ],
      ),
    );
  }
}
