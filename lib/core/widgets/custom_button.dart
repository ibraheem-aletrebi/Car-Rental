import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.width,
    this.height,
    this.textStyle,
  });
  final String text;
  final void Function()? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backgroundColor ?? AppColors.kPrimaryColor,
        minimumSize: Size(width ?? double.infinity, height ?? 62.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(62)),
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
      ),
      onPressed: onPressed,
      child: FittedBox(
        child: Text(
          text,
          style: textStyle ?? AppStyles.bold18.copyWith(color: textColor),
        ),
      ),
    );
  }
}
