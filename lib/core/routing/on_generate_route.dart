import 'package:car_rental/Feature/auth/presentation/view/reset_password_flow.dart';
import 'package:car_rental/Feature/auth/presentation/view/sign_in_view.dart';
import 'package:car_rental/Feature/auth/presentation/view/sign_up_view.dart';
import 'package:car_rental/Feature/auth/presentation/view/verification_code_view.dart';
import 'package:car_rental/Feature/car_details/presentation/view/car_details_view.dart';
import 'package:car_rental/Feature/car_details/presentation/view/car_reviews_view.dart';
import 'package:car_rental/Feature/home/presentation/view/main_view.dart';
import 'package:car_rental/Feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:car_rental/Feature/profile/presentation/view/profile_edit_view.dart';
import 'package:car_rental/core/animations/base_routes.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.kOnboardingView:
      return BaseRoute(page: OnBoardingView());

    case Routes.kSignInView:
      return BaseRoute(page: SignInView());

    case Routes.kSignUpView:
      return BaseRoute(page: SignUpView());

    case Routes.kVerificationCodeView:
      return BaseRoute(
        page: VerificationCodeView(phone: settings.arguments as String),
      );

    case Routes.kMainView:
      return BaseRoute(page: MainView());

    case Routes.kResetPasswordStepsView:
      return BaseRoute(page: ResetPasswordSteps());

    case Routes.kCarDetailsView:
      return BaseRoute(page: CarDetailsView(carId: settings.arguments as int));
    case Routes.kCarReviewsView:
      return BaseRoute(page: CarReviewsView(carId: settings.arguments as int));

    case Routes.kProfileEditView:
      return BaseRoute(page: const ProfileEditView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(),
        settings: settings,
      );
  }
}
