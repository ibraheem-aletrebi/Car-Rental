import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_cubit.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/dot_indicator.dart';
import 'package:car_rental/core/routing/routes.dart';
import 'package:car_rental/core/services/local_services/preference_manager.dart';
import 'package:car_rental/core/services/local_services/storage_key.dart';
import 'package:car_rental/core/widgets/custom_button.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingActionArea extends StatelessWidget {
  const OnboardingActionArea({super.key});
  @override
  Widget build(BuildContext context) {
    var onboardingControllers = context.read<OnboardingCubit>();
    return Column(
      children: [
        HeightSpace(height: 20),
        DotIndicator(),
        HeightSpace(height: 40),
        CustomButton(
          text: onboardingControllers.isLastPage() ? 'Get Started' : 'Next',
          onPressed: () {
            goToNext(onboardingControllers, context);
          },
        ),
        HeightSpace(height: 30),
      ],
    );
  }

  goToNext(OnboardingCubit onboardingControllers, BuildContext context) async {
    if (onboardingControllers.isLastPage()) {
      await PreferenceManager().setBool(StorageKey.shownOnBoarding, true);
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, Routes.kSignInView);
      }
    } else {
      onboardingControllers.changePage(onboardingControllers.currentIndex + 1);
    }
  }
}
