import 'package:car_rental/Feature/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/on_boarding_intro_header.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/onboarding_action_area.dart';
import 'package:car_rental/core/styles/app_colors.dart';
import 'package:car_rental/core/styles/app_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({super.key, required this.onBoardingEntity});
  final OnBoardingEntity onBoardingEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OnBoardingIntroHeader(title: onBoardingEntity.title),
        Spacer(),
        Text(
          onBoardingEntity.description,
          style: AppStyles.regular12.copyWith(color: AppColors.kWhiteColor),
        ),
        OnboardingActionArea(),
      ],
    );
  }
}
