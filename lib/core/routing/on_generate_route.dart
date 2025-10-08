import 'package:car_rental/Feature/auth/presentation/view/reset_password_flow.dart';
import 'package:car_rental/Feature/auth/presentation/view/sign_in_view.dart';
import 'package:car_rental/Feature/auth/presentation/view/sign_up_view.dart';
import 'package:car_rental/Feature/auth/presentation/view/verification_code_view.dart';
import 'package:car_rental/Feature/car_details/presentation/view/car_details_view.dart';
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
    case Routes.kVerificationCodeView:
      return MaterialPageRoute(
        builder: (context) =>
            VerificationCodeView(phone: settings.arguments as String),
        settings: settings,
      );
    case Routes.kMainView:
      return MaterialPageRoute(
        builder: (context) => MainView(),
        settings: settings,
      );
    case Routes.kResetPasswordStepsView:
      return MaterialPageRoute(
        builder: (context) => ResetPasswordSteps(),
        settings: settings,
      );

    case Routes.kCarDetailsView:
      return MaterialPageRoute(
        builder: (context) =>
            CarDetailsView(carId: settings.arguments as int),
        settings: settings,
      );


    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
        settings: settings,
      );
  }
}
