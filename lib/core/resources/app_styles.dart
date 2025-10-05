import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyles {
  static const String kFontFamily = 'Roboto';
  static TextStyle bold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.kWhiteColor,
  );

  static TextStyle semiBold50 = TextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kWhiteColor,
  );

  static TextStyle semiBold40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kWhiteColor,
  );

  static TextStyle semiBold30 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle semiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle semiBold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kSecondaryColor,
  );
  static TextStyle medium14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimaryColor,
  );

  static TextStyle regular16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kSecondaryColor,
  );

  static TextStyle regular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kSecondaryColor,
  );
}
  