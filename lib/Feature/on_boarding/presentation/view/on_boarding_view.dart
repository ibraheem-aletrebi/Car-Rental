import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_cubit.dart';
import 'package:car_rental/Feature/on_boarding/presentation/components/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: OnBoardingViewBody(),
        ),
      ),
    );
  }
}
