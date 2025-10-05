import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? horizontalRadius;

  const RoundedContainer({
    super.key,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.horizontalRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(horizontalRadius ?? 30.r),
        ),
        border: Border.all(color: borderColor ?? AppColors.kStokeColor),
        color: backgroundColor ?? AppColors.kWhiteColor,
      ),
      child: child,
    );
  }
}
