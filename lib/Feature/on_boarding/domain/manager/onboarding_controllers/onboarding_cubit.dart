import 'package:car_rental/Feature/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();
  int currentIndex = 0;

  void changePage(int index) {
    if (pageController.hasClients &&
        index >= 0 &&
        index < OnBoardingEntity.pages.length) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );
      currentIndex = index;
    }
  }

  bool isLastPage() => currentIndex == OnBoardingEntity.pages.length - 1;

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
