import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_rental/core/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarBrandItem extends StatelessWidget {
  final BrandModel brandModel;

  const CarBrandItem({super.key, required this.brandModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
              imageUrl: brandModel.image,
              fit: BoxFit.contain,
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 30.w),
              placeholder: (context, url) =>
                  Container(color: Colors.grey.shade300),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            brandModel.name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CardBrandItemLoadingWidget extends StatelessWidget {
  const CardBrandItemLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(height: 8.h),
          Container(width: 40.w, height: 12.h, color: Colors.grey.shade300),
        ],
      ),
    );
  }
}
