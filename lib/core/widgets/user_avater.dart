import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';

class UserAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? username;
  final double radius;
  final Color? borderColor;
  final double borderWidth;

  const UserAvatar({
    super.key,
    this.imageUrl,
    this.username,
    this.radius = 20,
    this.borderColor,
    this.borderWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    final initial = (username?.isNotEmpty ?? false)
        ? username![0].toUpperCase()
        : '?';

    return Container(
      width: radius * 2,
      height: radius * 2,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: borderColor ?? Colors.transparent,
      ),
      child: CircleAvatar(
        radius: radius.r,
        backgroundColor: AppColors.kStokeColor,
        backgroundImage: (imageUrl != null && imageUrl!.isNotEmpty)
            ? NetworkImage(imageUrl!)
            : null,
        child: (imageUrl == null || imageUrl!.isEmpty)
            ? Text(
                initial,
                style: AppStyles.semiBold16.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
              )
            : null,
      ),
    );
  }
}
