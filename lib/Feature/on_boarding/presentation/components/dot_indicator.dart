import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_cubit.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var onboardingControllers = context.read<OnboardingCubit>();
    return Center(
      child: DotsIndicator(
        position: onboardingControllers.currentIndex.toDouble(),
        dotsCount: onboardingControllers.pages.length,
        decorator: DotsDecorator(
          color: AppColors.kWhiteColor,
          activeColor: AppColors.kSecondaryColor,
          activeSize: const Size(24.0, 8.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }
}
