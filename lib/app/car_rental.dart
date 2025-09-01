import 'package:car_rental/core/routing/on_generate_route.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarRental extends StatelessWidget {
  const CarRental({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 971),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFEDEDED),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.kPrimaryColor,
            ),
            fontFamily: AppStyles.kFontFamily,
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: getInitialRoute(),
        );
      },
    );
  }

  String getInitialRoute() {
    return PreferenceManegar().getBool(StorageKey.shownOnBoarding) ?? false
        ? Routes.kSignInView
        : Routes.kOnboardingView;
  }
}
