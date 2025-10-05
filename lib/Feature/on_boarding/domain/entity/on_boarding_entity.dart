
import 'package:car_rental/core/resources/assets.dart';

class OnBoardingEntity {
  final String image;
  final String title;
  final String description;

  const OnBoardingEntity({
    required this.image,
    required this.title,
    required this.description,
  });

   static final List<OnBoardingEntity> pages = [
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
}
