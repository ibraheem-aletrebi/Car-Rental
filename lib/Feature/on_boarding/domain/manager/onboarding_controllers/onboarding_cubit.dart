import 'package:car_rental/Feature/on_boarding/domain/entity/on_boarding_entity.dart';
import 'package:car_rental/Feature/on_boarding/domain/manager/onboarding_controllers/onboarding_states.dart';
import 'package:car_rental/core/styles/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingStates> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<OnBoardingEntity> _pages = [
    OnBoardingEntity(
      image: Assets.imagesOnboarding1,
      title: 'Welcome to\nQent',
      description:
          'Discover your next adventure with Qent. We’re here to provide you with a seamless car rental experience.',
    ),
    OnBoardingEntity(
      image: Assets.imagesOnboarding2,
      title: 'Lets Start \nA New Experience \nWith Car rental.',
      description:
          'Pick the car that suits your journey and enjoy the ride with comfort and safety.',
    ),
  ];
  List<OnBoardingEntity> get pages => _pages;
  void changePage(int index) {
    if (pageController.hasClients && index >= 0 && index < _pages.length) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linearToEaseOut,
      );
      currentIndex = index;
    }
   
  }

  bool isLastPage() => currentIndex == _pages.length - 1;

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
