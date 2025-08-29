import 'package:car_rental/Feature/auth/presentation/view/forget_password_view.dart';
import 'package:car_rental/Feature/auth/presentation/view/sign_in_view.dart';
import 'package:car_rental/Feature/auth/presentation/view/sign_up_view.dart';
import 'package:car_rental/Feature/home/presentation/view/main_view.dart';
import 'package:car_rental/Feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.kOnboardingView:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
        settings: settings,
      );

    case Routes.kSignInView:
      return MaterialPageRoute(
        builder: (context) => SignInView(),
        settings: settings,
      );

    case Routes.kSignUpView:
      return MaterialPageRoute(
        builder: (context) => SignUpView(),
        settings: settings,
      );
    case Routes.kForgotPasswordView:
      return MaterialPageRoute(
        builder: (context) => ForgetPasswordView(),
        settings: settings,
      );

    case Routes.kMainView:
      return MaterialPageRoute(
        builder: (context) => MainView(),
        settings: settings,
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
        settings: settings,
      );
  }
}
