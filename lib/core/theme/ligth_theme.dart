import 'package:car_rental/core/resources/app_colors.dart';
import 'package:car_rental/core/resources/app_styles.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  // scaffoldBackgroundColor: Color(0xFFEDEDED),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.kPrimaryColor,
    primary: AppColors.kPrimaryColor,
  ),
  fontFamily: AppStyles.kFontFamily,
);
