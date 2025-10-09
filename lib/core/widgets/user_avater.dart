import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? username;
  final double radius;

  const UserAvatar({
    super.key,
    this.imageUrl,
    this.username,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final double size = radius * 2;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          height: size.h,
          width: size.w,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => _buildInitial(),
          placeholder: (context, url) => _buildInitial(),
        ),
      );
    }

    return _buildInitial();
  }

  Widget _buildInitial() {
    final initial = (username?.isNotEmpty ?? false)
        ? username![0].toUpperCase()
        : '?';

    return CircleAvatar(
      radius: radius.r,
      backgroundColor: AppColors.kStokeColor,
      child: Text(
        initial,
        style: AppStyles.semiBold16.copyWith(
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
