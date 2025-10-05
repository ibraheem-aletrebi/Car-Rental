import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyItem extends StatelessWidget {
  const NearbyItem({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 321 / 121,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.kStokeColor,
        ),
        child: CachedNetworkImage(
          imageUrl: imagePath,
          fit: BoxFit.contain,
          errorWidget: (context, url, error) =>
              const Icon(Icons.error, size: 40),
        ),
      ),
    );
  }
}
