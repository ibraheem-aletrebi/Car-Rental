import 'package:car_rental/Feature/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_cubit.dart';
import 'package:car_rental/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    var onboardingControllers = context.watch<OnboardingCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(OnBoardingEntity.pages.length, (index) {
        bool isActive = index == onboardingControllers.currentIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8,
          width: isActive ? 24 : 8,
          decoration: BoxDecoration(
            color: isActive ? AppColors.kSecondaryColor : AppColors.kWhiteColor,
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
