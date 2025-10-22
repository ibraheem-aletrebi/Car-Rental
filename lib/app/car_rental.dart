import 'package:car_rental/core/cubits/user_cubit/user_cubit.dart';
import 'package:car_rental/core/routing/on_generate_route.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:car_rental/core/services/service_locator.dart';
import 'package:car_rental/core/theme/ligth_theme.dart';
import 'package:car_rental/domain/repos/user_repo.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocProvider(
            create: (context) =>
                UserCubit(userProfileRepo: getIt<UserRepo>())
                  ..fetchUserProfile(),
            child: MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              navigatorKey: getIt<GlobalKey<NavigatorState>>(),
              theme: lightTheme,
              onGenerateRoute: onGenerateRoute,
              initialRoute: getInitialRoute(),
            ),
          ),
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
