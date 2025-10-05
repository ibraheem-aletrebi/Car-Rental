import 'package:car_rental/core/resources/app_styles.dart';
import 'package:car_rental/core/resources/assets.dart';
import 'package:car_rental/core/widgets/height_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingIntroHeader extends StatelessWidget {
  const OnBoardingIntroHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeightSpace(height: 20),
        SvgPicture.asset(Assets.imagesCarLogo),
        HeightSpace(height: 50),
        Text(title, style: AppStyles.semiBold40),
      ],
    );
  }
}
