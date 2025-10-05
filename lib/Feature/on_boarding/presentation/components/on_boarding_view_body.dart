import 'package:car_rental/Feature/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_cubit.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    var onboardingControllers = context.read<OnboardingCubit>();
    return Stack(
      children: [
        PageView(
          controller: onboardingControllers.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: OnBoardingEntity.pages
              .map((e) => PageViewItem(onBoardingEntity: e))
              .toList(),
        ),
      ],
    );
  }
}
