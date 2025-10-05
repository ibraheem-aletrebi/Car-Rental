import 'package:car_rental/core/routing/on_generate_route.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:car_rental/core/theme/ligth_theme.dart';
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
          theme: lightTheme,
          onGenerateRoute: onGenerateRoute,
          initialRoute: getInitialRoute(), 
        );
      },
    );
  }

  String getInitialRoute() {
    bool isShownOnBoarding =
        PreferenceManager().getBool(StorageKey.shownOnBoarding) ?? false;
    bool isSignedIn =
        PreferenceManager().getBool(StorageKey.isSignedIn) ?? false;
    if (isShownOnBoarding) {
      return isSignedIn ? Routes.kMainView : Routes.kSignInView;
    } else {
      return Routes.kOnboardingView;
    }
  }
}
