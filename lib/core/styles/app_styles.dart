import 'package:car_rental/core/styles/app_colors.dart';
import 'package:flutter/widgets.dart';

abstract class AppStyles {

  static const String kFontFamily = 'Roboto';
  static const TextStyle bold18 =TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.kWhiteColor,
  );


  static const TextStyle semiBold50 =TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.w600,
     color: AppColors.kWhiteColor,
  );

    static const TextStyle semiBold40 =TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
     color: AppColors.kWhiteColor,
  );

  static const TextStyle semiBold30 =TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w600,
  );

      static const TextStyle semiBold16 =TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryColor,
  );

    static const TextStyle semiBold14 =TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.kPrimaryColor,
  );

    static const TextStyle semiBold12 =TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.kSecondaryColor,
  );
      static const TextStyle medium14 =TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.kPrimaryColor,
  );

  static const TextStyle regular16 =TextStyle(
    fontSize: 16,
     fontWeight: FontWeight.w400,
  );

    static const TextStyle regular14 =TextStyle(
    fontSize: 14,
     fontWeight: FontWeight.w400,
     color: AppColors.kSecondaryColor,
  );


    static const TextStyle regular12 =TextStyle(
    fontSize: 12,
     fontWeight: FontWeight.w400,
     color: AppColors.kSecondaryColor,
  );

}